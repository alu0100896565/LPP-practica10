module Food

    class Menu
        attr_reader :nombre, :descripcion, :conjPlatos, :conjPrecios
        def initialize(nombre)
            @nombre = nombre
            @descripcion = ""
            @conjPlatos = []
            @conjPrecios = []
        end

    end

end