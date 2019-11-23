module Food
    class Alimentos

      include Comparable
        attr_reader :nombre, :emisiones, :terreno, :prot, :carbs, :lip
        def initialize(datos)
    
          @nombre = datos[:nombre]
          @emisiones = datos[:emisiones]
          @terreno = datos[:terreno]
          @prot = datos[:prot]
          @carbs = datos[:carbs]
          @lip = datos[:lip]
    
        end
    
        def to_s
    
          "#{@nombre}: { prot: #{@prot}, carbs: #{@carbs}, lip: #{@lip}, emisiones: #{@emisiones}, terreno: #{@terreno} }"
        end
    
        def valorEnergetico
          ((@prot*4.0)+(@carbs*4.0)+(@lip*9.0)).round(3)
        end
    
        def +(other)
          suma = { :nombre => "Mezcla", :emisiones => (self.emisiones+other.emisiones).round(3), :terreno => (self.terreno+other.terreno).round(3), :prot => (self.prot+other.prot).round(3), :carbs => (self.carbs+other.carbs).round(3), :lip => (self.lip+other.lip).round(3)}
          Alimentos.new(suma)
        end
      end
end