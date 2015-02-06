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
	vf = VarFactory.VarFactory()      	
	testVar = vf.fieldVar("testVar", 2)
	ID = testVar.ID()
	testVertex = 4294967295
        testFieldID = 9
        testValue = 17.1
	bc = BC.BC(False)
        bc.addSinglePointBC(testFieldID, testValue)
        #Test to see if Single Point BC has been added correctly
        self.assertFalse(bc.bcsImposed(testFieldID), "Single Point BC not Imposed")
        self.assertTrue(bc.singlePointBC(testFieldID), "No Single Point BC")
        self.assertTrue(testValue == bc.valueForSinglePointBC(testFieldID), "Value on Single Point BC not maintained")
        self.assertEquals(testVertex, bc.vertexForSinglePointBC(testFieldID), "Vertex on Single Point BC not maintained")


    #Defines Tests for ZeroMeanConstraint
    def testZeroMeanConstraint(self):
        #Initial Test Values & Set up of Dummy variable
	vf = VarFactory.VarFactory()
	bc = BC.BC(False)	
        testVar = vf.fieldVar("testVar", 2)
        ID = testVar.ID()
        bc.addZeroMeanConstraint(testVar)
        
        #Test to see if ZeroMeanConstraint has been added correctly
        self.assertTrue(bc.imposeZeroMeanConstraint(ID), "No Zero Mean Constraint Imposed")
        
        #Test to see if one can correctly remove ZeroMeanConstraint
        bc.removeZeroMeanConstraint(ID)
        self.assertFalse(bc.imposeZeroMeanConstraint(ID), "Zero Mean Constraint not removed")


    #Defines Tests for Dirichlet
    def testDirichlet(self):
        #Initial Test Values & Set up of Dummy variable
        testSpatialFilter = SpatialFilter.SpatialFilter.allSpace()
        testFunction = Function.Function.xn()
        vf = VarFactory.VarFactory()
	bc = BC.BC(False)
	traceVar = vf.traceVar("traceVar", 2)
        ID = traceVar.ID()
	a = BC.pairs(testSpatialFilter, testFunction)
        bc.addDirichlet(traceVar, testSpatialFilter, testFunction)
        

        #Tests to see if Dirichlet has been added correctly
        self.assertTrue(testFunction.evaluate(2,3) == bc.getDirichletBC(ID)[1].evaluate(2,3), "Dirichlet BC failed")
	#Maybe same thing as line 60 for spatial filter?
        self.assertTrue(testFunction.evaluate(4,3) == bc.getSpatiallyFilteredFunctionForDirichletBC(ID).evaluate(4,3), "Dirichlet Spatially Filtered Funtion failed")
        
    
if (__name__ == '__main__'):
    unittest.main()
