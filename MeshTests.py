"""import swig files & whatever"""
import unittest
import MeshFactory
import Mesh
import BF
import VarFactory

class TestMesh(unittest.TestCase):
    
    def testCellPolyOrder(self):

        #Mesh.vectori(2
        dimensions = MeshFactory.vectord(2, 2.3)
        elements = MeshFactory.vectori(2,2)
        bf = BF.BF_bf(VarFactory.VarFactory()) #ToDo Give the VarFactory a field & test variable
        testMesh = MeshFactory.MeshFactory_rectilinearMesh(bf, dimensions, elements, 1) 

        print testMesh.cellPolyOrder()
        

if (__name__ == '__main__'):
    unittest.main()
