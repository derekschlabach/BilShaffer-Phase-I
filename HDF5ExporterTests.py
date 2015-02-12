"""import swig files & whatever"""
import BC
import VarFactory
import SpatialFilter
import Function
import Var
import unittest
import Mesh
import MeshFactory
import Solution
import PoissonFormulation
import HDF5Exporter
import BF

class TestHDF5Exporter(unittest.TestCase):

    #Defines Tests for exporter methods
    def testExporter(self):
        #Initial Test Values & Set Up Dummy Variables
        poissonForm = PoissonFormulation.PoissonFormulation(2, True)
        poissonBF = poissonForm.bf() #ToDo Give the VarFactory a field & test variable
        testMesh = MeshFactory.MeshFactory_rectilinearMesh(poissonBF, [1.2, 1.4], [2,3], 2)
        testFunction = Function.Function.xn()
	testFunction2 = Function.Function.yn()
	testVector = [testFunction, testFunction2]
	testVector2 = ["function1", "function2"]
	testBC = BC.BC(False)
	testSolutionPtr = Solution.Solution_solution(testMesh)
        testExport = HDF5Exporter.HDF5Exporter(testMesh, "output", ".")

	#Tests exportFunction using definition #1
        #testExport.exportFunction(testFunction,"function",0)

	#Tests exportFunction using definition #2
	#testExport.exportFunction(testVector,testVector2,0)

	#Tests exportSolution
	testExport.exportSolution(testSolutionPtr,poissonBF.varFactory(), 0)
if (__name__ == '__main__'):
    unittest.main()
