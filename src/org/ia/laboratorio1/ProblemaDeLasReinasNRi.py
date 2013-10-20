from simpleai.search import breadth_first, depth_first, SearchProblem
from simpleai.search.viewers import ConsoleViewer

class ProblemaDeLasReinasNRi(SearchProblem):
    '''Problema de las n reinas NRi'''

    def __init__(self, pDimension):
        '''RESTRICCIONES:
        - El tablero no puede tener más filas que dimensión
        - Ninguna columna puede ser mayor que dimensión'''
        super(ProblemaDeLasReinasNRi, self).__init__(initial_state=[])
        
        #Dimension del tablero
        self._dimension = pDimension - 1

        #Acciones del problema
        self._actions = [self.nRi, self.nRi, self.nRi, self.nRi]
        
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
        '''El tablero NO tiene mas filas que dimensión Las columnas son menores que dimensión'''
        return(len(state)<=self._dimension and self.columnasValidas(state.estado) == True)

    def colocarUnaReina (self, state, action):
        colocar = dict() #creamos un nuevo diccionario
        
        for x in range(self._dimension):
            #Para cada columna inicializamos con una reina
            colocar.update({x: self.nRi(state, x)}) 
            
        return colocar(action)

    def nRi(self, state, columna): 
        #Colocar una reina en la n-esima columna
        state.append(columna)

    def actions(self, state):
        '''Dado un estado, devuelve a que estados puede ir'''
        return super(ProblemaDeLasReinasNRi, self).actions(state)
    
    def result(self, state, action):
        '''Dado un estado y una accion devuelve el resultado de 
        aplicar esa accion a ese resultado.'''
        return self.nRi(state, action)

    def is_goal(self, state):
        '''Comprueba si ha llegado al nodo destino'''
        resultado = False
        x = 0
        while not resultado and x < len(state):

            y = 0
            reina1 = [x, state[x]]

            while not resultado and y < len(state):
                
                #Creamos un par de reinas con la notacion (fila, columna)
                
                reina2 = [y, state[y]]

                #Si hay reinas en la misma diagonal, o estan en 
                #la misma columna, salimos y devolvemos que no es 
                #el nodo destino
                resultado = self.reinasEnMismaDiagonal(reina1, reina2) or \
                    reina1[1] == reina2[1] or set(state) == set(self.initial_state)
                print set(state) == set(self.initial_state)
                print set(state)
                print set(self.initial_state)
                y += 1
            x += 1
        return not resultado

    def reinasEnMismaDiagonal(self, pReina1, pReina2):
        '''Devuelve True si las dos reinas estan en la misma columna
        y False si estan en distintas columnas'''
        return (pReina1[0] - pReina1[1] == pReina2[0] - pReina2[1]) or \
            (pReina1[0] + pReina1[1] == pReina2[0] + pReina2[1])



problem = ProblemaDeLasReinasNRi(4)
print problem.is_goal([2,0,3,3])
print len([2,0,3,3])
my_viewer = ConsoleViewer()
result = breadth_first(problem, viewer=my_viewer)
print result.path()

problem = ProblemaDeLasReinasNRi(4)
result = depth_first(problem, viewer = my_viewer)
print result.path()