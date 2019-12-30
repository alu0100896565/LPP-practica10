module Food

    class Menu
        attr_reader :nombre, :descripcion, :conjPlatos, :conjPrecios
        def initialize(nombre)
            @nombre = nombre
            @descripcion = ""
            @conjPlatos = []
            @conjPrecios = []
        end

        def findPlato(name)
            Platos.arrayPlatos.find { |x| name == x.descripcion }
        end

    end

end