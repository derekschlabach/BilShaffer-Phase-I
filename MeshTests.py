"""import swig files & whatever"""
import unittest
import MeshFactory
import Mesh
import BF
import VarFactory
import PoissonFormulation

class TestMesh(unittest.TestCase):
    
    def testMeshNormal(self):

        poissonForm = PoissonFormulation.PoissonFormulation(2, True)
        poissonBF = poissonForm.bf()
        h1Order = 2
        cellsX = 2
        cellsY = 3
        numElements = cellsX * cellsY
        activeCellIDs = tuple([])
        for i in range(0, numElements):
            activeCellIDs += tuple([i])
        testMesh = MeshFactory.MeshFactory_rectilinearMesh(poissonBF, [1.2, 1.4], [cellsX,cellsY], h1Order) 
        

        self.assertTrue(testMesh.cellPolyOrder(0) == h1Order, "h1Order Broken")
        self.assertTrue(testMesh.numFluxDofs() + testMesh.numFieldDofs() == testMesh.numGlobalDofs())
        self.assertTrue(numElements == testMesh.numElements())
        self.assertTrue(numElements == testMesh.numActiveElements())
        self.assertTrue(activeCellIDs == testMesh.getActiveCellIDs())
        polyOrder = testMesh.cellPolyOrder(0)
        
        print testMesh.getDimension()

        testMesh.pRefine(tuple([0]))
        testMesh.hRefine(tuple([0]))
        numElements += 4
        numActiveElements = numElements - 1
        polyOrder += 1


        self.assertTrue(polyOrder == testMesh.cellPolyOrder(0))
        self.assertTrue(numElements == testMesh.numElements())
        self.assertTrue(numActiveElements == testMesh.numActiveElements())

        filename = ".savetest"
        testMesh.saveToHDF5(filename)
        #testMesh2 = MeshFactory.MeshFactory_loadFromHDF5(poissonBF,filename)
        

    def testMeshVertices(self):
        
        poissonForm = PoissonFormulation.PoissonFormulation(2, True)
        poissonBF = poissonForm.bf()
        testMesh = MeshFactory.MeshFactory_rectilinearMesh(poissonBF, [1.2, 1.4], [1,1], 2)

        print "\n\nVertex Indices For Cell"
        print testMesh.vertexIndicesForCell(0)
        print testMesh.verticesForCell(0)
        

if (__name__ == '__main__'):
    unittest.main()
