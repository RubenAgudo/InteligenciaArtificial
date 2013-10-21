# coding=utf-8
from simpleai.search import SearchProblem
import copy
#from simpleai.search.viewers import ConsoleViewer
#from simpleai.search.traditional import breadth_first, depth_first

class ProblemaDeLasReinasNRi(SearchProblem):
    '''Problema de las n reinas NRi'''

    def __init__(self, pDimension):
        '''RESTRICCIONES:
        - El tablero no puede tener m�s filas que dimensi�n
        - Ninguna columna puede ser mayor que dimensi�n'''
        super(ProblemaDeLasReinasNRi, self).__init__(initial_state=[])
        
        #Dimension del tablero
        self._dimension = pDimension

        #Acciones del problema
        self._actions = [1,2,3,4]
        
        #Representacion del tablero
        #ESTADO INICIAL
        self.initial_state = []
        

    def columnasValidas(self, t):
        '''comprueba si la columna es valida'''
        bien = True
        if len(t) > 0: 
            for i in range(0, len(t)):
                bien = bien and \
                t[i] <= self._dimension
        return bien
    
    def _is_valid(self, state):
        '''El tablero NO tiene mas filas que dimensi�n Las columnas son menores que dimensi�n'''
        return(len(state)<=self._dimension and self.columnasValidas(state.estado) == True)

    #def colocarUnaReina (self, state, action):
    #    colocar = dict() #creamos un nuevo diccionario
        
    #    for x in range(self._dimension):
    #        #Para cada columna inicializamos con una reina
    #        colocar.update({x: self.__nRi(state, x)}) 
            
    #    return colocar(action)

    def __nRi(self, state, columna): 
        #Colocar una reina en la n-esima columna
        state.append(columna)
        return state

    def actions(self, state):
        '''Dado un estado, devuelve a que estados puede ir'''
        columna = 0
        lista = []
        if(len(state) < self._dimension):
            
            while columna < self._dimension:
                estado = copy.deepcopy(state)
                self.__nRi(estado, columna)
                lista.append(estado)
                columna += 1
        return lista
    
    def result(self, state, action):
        '''Dado un estado y una accion devuelve el resultado de 
        aplicar esa accion a ese resultado.'''
        return self.__nRi(state, action)

    def is_goal(self, state):
        
        '''Comprueba si ha llegado al nodo destino'''
        resultado = False
        x = 0
        while not resultado and x < len(state):

            y = x + 1
            reina1 = [x, state[x]]

            while not resultado and y < len(state):
                
                #Creamos un par de reinas con la notacion (fila, columna)
                
                reina2 = [y, state[y]]

                #Si hay reinas en la misma diagonal, o estan en 
                #la misma columna, salimos y devolvemos que no es 
                #el nodo destino
                resultado = self.__reinasEnMismaDiagonal(reina1, reina2) or \
                    reina1[1] == reina2[1] 
              
                y += 1
            x += 1
        return not resultado and set(state) != set(self.initial_state)

    def __reinasEnMismaDiagonal(self, pReina1, pReina2):
        '''Devuelve True si las dos reinas estan en la misma columna
        y False si estan en distintas columnas'''
        return (pReina1[0] - pReina1[1] == pReina2[0] - pReina2[1]) or \
            (pReina1[0] + pReina1[1] == pReina2[0] + pReina2[1])

problem = ProblemaDeLasReinasNRi(4)

var = problem.result([], 2)
print "El resultaod deberia ser 2 y es" + var.__str__()

var = problem.actions([])
print "El resultado deberia ser [0],[1],[2],[3] y es" + var.__str__()

var = problem.actions([1])
print "El resultado deberia ser [1,0],[1,1],[1,2],[1,3] y es" + var.__str__()

var = problem.actions([1,2,3,4])
print "El resultado deberia ser [] y es" + var.__str__()

var = problem.is_goal([])
print "el resultado deberia ser False y es: " + var.__str__()

var = problem.is_goal([0,1,2,3])
print "el resultado deberia ser False y es: " + var.__str__()

var = problem.is_goal([2,0,3,1])
print "el resultado deberia ser True y es: " + var.__str__()

var = problem.is_goal([1,3,0,2])
print "el resultado deberia ser True y es: " + var.__str__()
# my_viewer = ConsoleViewer()
# result = breadth_first(problem, viewer=my_viewer)
# print result.path()
# 
# problem = ProblemaDeLasReinasNRi(4)
# result = depth_first(problem, viewer = my_viewer)
# print result.path()
