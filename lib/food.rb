


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
    
      end

