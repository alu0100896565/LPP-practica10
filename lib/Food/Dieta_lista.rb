# encoding: utf-8
# Este módulo se ha creado para describir
# el comportamiento tanto de alimentos
# como de platos formados por ellos mediante
# listas de los mismos, centrandose en su
# informacion nutricional y su huella ambiental.
#
# Author::    Eduardo Suarez Ojeda  (mailto:alu0100896565@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby
module Food

    # Esta clase representa una dieta cuyo conjunto de alimentos
    # es una lista de la clase creada anteriormente.
    # Es hija dela clase List.
    class Dieta_lista < List

        attr_reader :alimentoTotal
        # Inicializa con el nombre de la dieta y el genero.
       def initialize(nombre, genero_)

        super()
        @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
        @genero = genero_
    end
    
    # Inserta un alimento por la cabeza.
    def insert_headS(alimento)
        raise TypeError, "Se espera como argumento un alimento" unless alimento.is_a?Alimentos
        
        insert_head(alimento)
    end

    # Inserta un alimento por la cola.
    def insert_tailS(alimento)
        raise TypeError, "Se espera como argumento un alimento" unless alimento.is_a?Alimentos
        
        insert_tail(alimento)
    end

    # Obtiene la suma nutricional de todos los alimentos de la dieta.
    def suma_total

        nodo=@head
        
        while nodo!=nil do
          @alimentoTotal += nodo.value
          nodo = nodo.next
        end
        
    end

    # Comprueba que se cumpla el idr para el genero especificado.
    def idr
    
        if @genero = "hombre" && @alimentoTotal.prot >= 54.0 && @alimentoTotal.valorEnergetico >= 3000
          return true
        elsif @genero = "mujer" && @alimentoTotal.prot >= 41.0 && @alimentoTotal.valorEnergetico >= 2300
          return true
        else return false
  
        end
      end

      # Obtiene los porcentajes de nutrientes de manera formateada.
      def porcentajes
        por_prot = (((@alimentoTotal.prot * 4) / @alimentoTotal.valorEnergetico) * 100.00).round(3)
        por_carbs = (((@alimentoTotal.carbs * 4) / @alimentoTotal.valorEnergetico) * 100.00).round(3)
        por_lip = (((@alimentoTotal.lip * 9) / @alimentoTotal.valorEnergetico) * 100.00).round(3)

        "Proteinas: #{por_prot}%, Carbohidratos: #{por_carbs}%, Lipidos: #{por_lip}%."
      end

      # Obtiene las emisiones anuales de la dieta.
      def emisionesAnuales
        (@alimentoTotal.emisiones * 365).round(3)
      end
end

end

