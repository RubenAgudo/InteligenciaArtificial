# encoding=utf-8
from laboratorio1 import ProblemaDeLasReinasNRi
from simpleai.search import breadth_first, depth_first
from simpleai.search.viewers import ConsoleViewer
'''
Created on 21/10/2013

@author: Rub�n
'''

problem = ProblemaDeLasReinasNRi(4)
my_viewer = ConsoleViewer()
result = breadth_first(problem, viewer=my_viewer)
print result.path()

problem = ProblemaDeLasReinasNRi(4)
result = depth_first(problem, viewer = my_viewer)
print result.path()
