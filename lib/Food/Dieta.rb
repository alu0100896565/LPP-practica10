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

    # Esta clase representa un conjunto de alimentos.
    class Dieta

        attr_reader :nombre, :genero, :alimentos, :alimentoTotal
        # Inicializa con un conjunto de alimentos, el nombre de la dieta y el genero.
        def initialize(nombre, genero, alimentos)
          @nombre = nombre
          @genero = genero
          if alimentos.instance_of? Array
          @alimentos = alimentos
          end
          @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
        end
    
        # Suma total de los alimentos de la dieta.
        def sumaAlimentos
    
          @alimentos.each { |x| @alimentoTotal=@alimentoTotal+x}
    
        end
    
        # Compruba si la dieta cumple el idr para el genero especificado.
        def idr
    
          if @genero = "hombre" && @alimentoTotal.prot >= 54.0 && @alimentoTotal.valorEnergetico >= 3000
            return true
          elsif @genero = "mujer" && @alimentoTotal.prot >= 41.0 && @alimentoTotal.valorEnergetico >= 2300
            return true
          else return false
    
          end
        end
    
        # Genera el impacto ambiental formateado.
        def impactoAmbiental
    
          "Para la dieta #{@nombre} las emisiones de gases kgCO2eq son: #{@alimentoTotal.emisiones} y el terreno usado en m2 por año es: #{@alimentoTotal.terreno}"
    
        end
        
      end

end