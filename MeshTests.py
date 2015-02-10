"""import swig files & whatever"""
import unittest
import MeshFactory
import Mesh
import BF
import VarFactory
import PoissonFormulation

class TestMesh(unittest.TestCase):
    
    def testCellPolyOrder(self):


        poissonForm = PoissonFormulation.PoissonFormulation(2, True)
        poissonBF = poissonForm.bf() #ToDo Give the VarFactory a field & test variable
        testMesh = MeshFactory.MeshFactory_rectilinearMesh(poissonBF, [1.3, 1.4], [2,3], 1) 

        print testMesh.cellPolyOrder(0)
        

if (__name__ == '__main__'):
    unittest.main()
