module Food

    class Dieta_lista

       def initialize(lista)

        raise TypeError, "Se espera como argumento una lista: List" unless lista.is_a?List
        @lista_alim = lista

    end

end

end

