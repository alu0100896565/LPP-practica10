module Food

    class Dieta

        attr_reader :nombre, :genero, :alimentos, :alimentoTotal
        def initialize(nombre, genero, alimentos)
          @nombre = nombre
          @genero = genero
          if alimentos.instance_of? Array
          @alimentos = alimentos
          end
          @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
        end
    
        def sumaAlimentos
    
          @alimentos.each { |x| @alimentoTotal=@alimentoTotal+x}
    
        end
    
        def idr
    
          if @genero = "hombre" && @alimentoTotal.prot >= 54.0 && @alimentoTotal.valorEnergetico >= 3000
            return true
          elseif @genero = "mujer" && @alimentoTotal.prot >= 41.0 && @alimentoTotal.valorEnergetico >= 2300
            return true
          else return false
    
          end
        end
    
        def impactoAmbiental
    
          "Para la dieta #{@nombre} las emisiones de gases kgCO2eq son: #{@alimentoTotal.emisiones} y el terreno usado en m2 por año es: #{@alimentoTotal.terreno}"
    
        end
        
      end

end