from BCTests import *
#from MeshTests import *
#from MeshFactoryTests import *
import unittest


testSuite = unittest.makeSuite(TestBC)
#testSuite.addTest(unittest.makesuite(TestMesh))
#testSuite.addTest(unittest.makesuite(TestMeshFactory))

testRunner = unittest.TextTestRunner()
testRunner.run(testSuite)
