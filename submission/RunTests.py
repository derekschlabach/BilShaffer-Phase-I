from BCTests import *
from MeshTests import *
from HDF5ExporterTests import *
import unittest


testSuite = unittest.makeSuite(TestBC)
testSuite.addTest(unittest.makeSuite(TestMesh))
testSuite.addTest(unittest.makeSuite(TestHDF5Exporter))

testRunner = unittest.TextTestRunner()
testRunner.run(testSuite)
