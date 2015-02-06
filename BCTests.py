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
        self.assertTrue(bcsImposed(testFieldID), "Single Point BC not Imposed")
        self.assertTrue(singlePointBC(testFieldID), "No Single Point BC")
        self.assertTrue(testValue == valueForSinglePointBC(testFieldID), "Value on Single Point BC not maintained")
        self.assertTrue(testVertex == vertexForSinglePointBC(testFieldID), "Vertex on Single Point BC not maintained")


    #Defines Tests for ZeroMeanConstraint
    def testZeroMeanConstraint(self):
        #Initial Test Values & Set up of Dummy variable
	vf = VarFactory.VarFactory()	
	L2 = 2
        testVar = VarFactory.VarFactory.testVar(vf, ("testVar", L2))
        ID = testVar.ID()
        addZeroMeanConstraint(testVar)
        
        #Test to see if ZeroMeanConstraint has been added correctly
        self.assertTrue(imposeZeroMeanConstraint(ID), "No Zero Mean Constraint Imposed")
        
        #Test to see if one can correctly remove ZeroMeanConstraint
        removeZeroMeanConstraint(ID)
        self.assertFalse(imposeZeroMeanConstraint(ID), "Zero Mean Constraint not removed")


    #Defines Tests for Dirichlet
    def testDirichlet(self):
        #Initial Test Values & Set up of Dummy variable
        testSpatialFilter = SpatialFilter.SpatialFilter.allSpace()
        testFunction = Function.Function.xn()
        testVar = VarFactory.VarFactory.testVar("testVar", L2)
        ID = testVar.ID()
        addDirichlet(testVar, testSpatialFilter, testFunction)
        

        #Tests to see if Dirichlet has been added correctly
        self.assertTrue((testSpatialFilter, testFunction) == getDirichletBC(ID), "Dirichlet BC failed")
        self.assertTrue(testFunction == getSpatiallyFilteredFunctionForDirichletBC(ID), "Dirichlet Spatially Filtered Funtion failed")
        
    
if (__name__ == '__main__'):
    unittest.main()
