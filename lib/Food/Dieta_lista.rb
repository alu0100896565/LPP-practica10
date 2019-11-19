module Food

    class Dieta_lista < List

       def initialize

        super()

    end
    
    def insert_headS(alimento)
        raise TypeError, "Se espera como argumento un alimento" unless alimento.is_a?Alimentos
        nodo = Node.new(alimento, nil, nil)
        insert_head(nodo)
    end

    def insert_tailS(alimento)
        raise TypeError, "Se espera como argumento un alimento" unless alimento.is_a?Alimentos
        nodo = Node.new(alimento, nil, nil)
        insert_tail(nodo)
    end

end

end

