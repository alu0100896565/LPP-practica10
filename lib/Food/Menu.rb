module Food

    class Menu
        attr_reader :nombre, :descripcionp, :conjPlatos, :conjPrecios
        def initialize(nombre)
            @nombre = nombre
            @descripcionp = ""
            @conjPlatos = []
            @conjPrecios = []
        end

        def findPlato(name)
            Platos.arrayPlatos.find { |x| name == x.descripcion }
        end

        def componente(options = {})
            if options[:descripcion]
                @conjPlatos << findPlato(options[:descripcion])
                precio = 9.99
                precio = options[:precio] if options[:precio]
                @conjPrecios << precio
            else return nil
            end
        end

        def descripcion(name)
            @descripcionp = name
        end 

    end

end