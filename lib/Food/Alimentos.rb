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

    # Esta clase representa un alimento.
    # Se he incluido el mixin comparable.
    class Alimentos

      include Comparable
        attr_reader :nombre, :emisiones, :terreno, :prot, :carbs, :lip

        # Se inicializan los datos del alimento.
        def initialize(datos)
    
          @nombre = datos[:nombre]
          @emisiones = datos[:emisiones]
          @terreno = datos[:terreno]
          @prot = datos[:prot]
          @carbs = datos[:carbs]
          @lip = datos[:lip]
    
        end

        # Se define para incluir el mixin comparable.
        # Se compara primero el valor energetico
        # en caso de empate se compara su valor ambiental.
        def <=>(anOther)
          if not anOther.is_a? Alimentos
            return nil
          end
          [self.valorEnergetico, self.valorAmbiental] <=> [anOther.valorEnergetico, anOther.valorAmbiental]  
        end
    
        # Paso a cadena del objeto Alimentos formateado.
        def to_s
    
          "#{@nombre}: { prot: #{@prot}, carbs: #{@carbs}, lip: #{@lip}, emisiones: #{@emisiones}, terreno: #{@terreno} }"
        end
    
        # Calcula el valor energetico del alimento.
        def valorEnergetico
          ((@prot*4.0)+(@carbs*4.0)+(@lip*9.0)).round(3)
        end

        # Calcula el valor ambiental del alimento
        def valorAmbiental
          (1/(@emisiones + @terreno)).round(3)
        end
    
        # Suma de los alimentos
        def +(other)
          suma = { :nombre => "Mezcla", :emisiones => (self.emisiones+other.emisiones).round(3), :terreno => (self.terreno+other.terreno).round(3), :prot => (self.prot+other.prot).round(3), :carbs => (self.carbs+other.carbs).round(3), :lip => (self.lip+other.lip).round(3)}
          Alimentos.new(suma)
        end

        # Multiplicacion del alimento por la cantidad de gramos del mismo.
        def *(gram)
          raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer
          mult = { :nombre => self.nombre, :emisiones => self.emisiones*(gram/100.0), :terreno => self.terreno*(gram/100.0), :prot => self.prot*(gram/100.0), :carbs => self.carbs*(gram/100.0), :lip => self.lip*(gram/100.0)}
          Alimentos.new(mult)
        end
      end
end