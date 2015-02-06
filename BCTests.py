"""import swig files & whatever"""
import BC
import VarFactory
import SpatialFilter
import Function
import Var
import unittest

class TestBC(unittest.TestCase):

    #Defines Tests for SinglePointBC
    def testSinglePoint(self):
        #Initial Test Values & Set up of Dummy variable
        testVertex = 11
        testFieldID = 9
        testValue = 17.1
        BC.BC.addSinglePointBC(testFieldID, testValue, meshVertexNumber = testVertex)
        #Test to see if Single Point BC has been added correctly
        self.assertTrue(BC.bcsImposed(testFieldID), "Single Point BC not Imposed")
        self.assertTrue(BC.singlePointBC(testFieldID), "No Single Point BC")
        self.assertTrue(testValue == BC.valueForSinglePointBC(testFieldID), "Value on Single Point BC not maintained")
        self.assertTrue(testVertex == BC.vertexForSinglePointBC(testFieldID), "Vertex on Single Point BC not maintained")


    #Defines Tests for ZeroMeanConstraint
    def testZeroMeanConstraint(self):
        #Initial Test Values & Set up of Dummy variable
	vf = VarFactory.VarFactory()	
        testVar = VarFactory.VarFactory.testVar(vf, ("testVar", L2))
        ID = testVar.ID()
        BC.addZeroMeanConstraint(testVar)
        
        #Test to see if ZeroMeanConstraint has been added correctly
        self.assertTrue(BC.imposeZeroMeanConstraint(ID), "No Zero Mean Constraint Imposed")
        
        #Test to see if one can correctly remove ZeroMeanConstraint
        BC.removeZeroMeanConstraint(ID)
        self.assertFalse(BC.imposeZeroMeanConstraint(ID), "Zero Mean Constraint not removed")


    #Defines Tests for Dirichlet
    def testDirichlet(self):
        #Initial Test Values & Set up of Dummy variable
        testSpatialFilter = SpatialFilter.SpatialFilter.allSpace()
        testFunction = Function.Function.xn()
        testVar = VarFactory.VarFactory.testVar("testVar", L2)
        ID = testVar.ID()
        BC.addDirichlet(testVar, testSpatialFilter, testFunction)
        

        #Tests to see if Dirichlet has been added correctly
        self.assertTrue((testSpatialFilter, testFunction) == BC.getDirichletBC(ID), "Dirichlet BC failed")
        self.assertTrue(testFunction == BC.getSpatiallyFilteredFunctionForDirichletBC(ID), "Dirichlet Spatially Filtered Funtion failed")
        
    
if (__name__ == '__main__'):
    unittest.main()
