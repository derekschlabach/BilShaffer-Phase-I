"""import swig files & whatever"""
import unittest

class TestBC(unittest.TestCase):
    
    def testSinglePoint(self):
        testVertex = 11
        testFieldID = 9
        testValue = 17.1
        addSinglePointBC(testFieldID, testValue, meshVertexNumber = testVertex)
        
        

if (__name__ == '__main__'):
    unittest.main()
