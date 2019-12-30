module Food

    class Menu
        attr_reader :nombre, :descripcion
        def initialize(nombre)
            @nombre = nombre
            @descripcion = ""

        end

    end

end