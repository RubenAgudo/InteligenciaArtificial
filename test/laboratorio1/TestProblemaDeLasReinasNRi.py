# encoding=utf-8
from laboratorio1 import ProblemaDeLasReinasNRi
'''
Created on 21/10/2013

@author: Rub�n
'''
import unittest


class Test(unittest.TestCase):
    

    def setUp(self):
        self.problem = ProblemaDeLasReinasNRi(4)
        
        pass


    def tearDown(self):
        pass


    def testIs_Goal(self):
        print self.problem.is_goal([])
        print self.problem.actions([2])
        pass


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testIs_Goal']
    unittest.main()