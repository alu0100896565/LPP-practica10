module Food

    class Dieta_lista < List

        attr_reader :alimentoTotal
       def initialize(nombre, genero)

        super()
        @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
        @genero = genero
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

    def idr
    
        if @genero = "hombre" && @alimentoTotal.prot >= 54.0 && @alimentoTotal.valorEnergetico >= 3000
          return true
        elseif @genero = "mujer" && @alimentoTotal.prot >= 41.0 && @alimentoTotal.valorEnergetico >= 2300
          return true
        else return false
  
        end
      end

end

end

