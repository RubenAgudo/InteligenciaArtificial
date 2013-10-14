from simpleai.search import breadth_first, depth_first, SearchProblem
from simpleai.search.viewers import ConsoleViewer

class ProblemaDeLasReinasNRi(SearchProblem):
    '''Problema de las n reinas NRi'''

    def __init__(self, pDimension):
        
        super(ProblemaDeLasReinasNRi, self).__init__(initial_state=[])
        
        #Dimensión del tablero
        self._dimension = pDimension

        #Acciones del problema
        self._actions=[nR1, nR2, nR3, nR4]
        
        #Representación del tablero
        '''ESTADO INICIAL'''
        self.initial_state = []
        '''RESTRICCIONES:
        - El tablero no puede tener más filas
        que dimensión
        - Ninguna columna puede ser mayor
        que dimensión'''

    def columnasValidas(self, t):
        bien=True
        if len(t)>0: 
            for i in range(0, len(t)):
                bien=bien and \
                t[i]<=self._dimension
                return bien
    
    
    def _is_valid(self, state):
        '''El tablero NO tiene mas filas que dimensión Las columnas son menores que dimensión'''
        return(len(state)<=self._dimension and columnasValidas(self, state.estado))

    def  colocarUnaReina (self, state, action):
        def nR1( self , state): #Colocar una reina en la primera columna
            state.append(1)
        def nR2( self , state ): #Colocar una reina en la segunda columna
            state.append(2)
        def nR3( self , state ): #Colocar una reina en la tercera columna
            state.append(3)
        def nR4( self , state ): #Colocar una reina en la primera columna
            state.append(4)
    
        colocar = {1: nR1(state),
                2: nR2(state),
                3: nR3(state),
                4: nR4(state)}
        return colocar(action)

    def actions(self, state):
        return super(ProblemaDeLasReinasNRi, self).actions(state)

problem = ProblemaDeLasReinasNRi(4)
my_viewer = ConsoleViewer()
result = breadth_first(problem, viewer=my_viewer)
print result.path()