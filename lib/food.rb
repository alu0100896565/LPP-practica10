


  class Alimentos

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
      (@prot*4.0)+(@carbs*4.0)+(@lip*9.0)
    end

    def +(other)
      suma = { :nombre => "Mezcla", :emisiones => self.emisiones+other.emisiones, :terreno => self.terreno+other.terreno, :prot => self.prot+other.prot, :carbs => self.carbs+other.carbs, :lip => self.lip+other.lip}
      Alimentos.new(suma)
    end
  end

  class Dieta

    def initialize
    end
    
      end

