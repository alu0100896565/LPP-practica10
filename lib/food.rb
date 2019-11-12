


  class Alimentos

    attr_reader :nombre, :emisiones, :terreno
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

  end

