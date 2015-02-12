#from BCTests import *
from MeshTests import *
#from MeshFactoryTests import *
from HDF5ExporterTests import *
import unittest


testSuite = unittest.makeSuite(TestMesh)
#testSuite.addTest(unittest.makesuite(TestMesh))
#testSuite.addTest(unittest.makesuite(TestMeshFactory))
testSuite = unittest.makeSuite(TestHDF5Exporter)

testRunner = unittest.TextTestRunner()
testRunner.run(testSuite)
