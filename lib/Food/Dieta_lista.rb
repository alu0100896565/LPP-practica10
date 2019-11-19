module Food

    class Dieta_lista < List

        attr_reader :alimentoTotal
       def initialize(nombre)

        super()
        @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})

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

    def suma_total

        nodo=@head
        
        while nodo!=nil do
          @alimentoTotal += nodo.value
          nodo = nodo.next
        end
        
    end
end

end

