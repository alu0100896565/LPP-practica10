module Food

    class Menu
        attr_reader :nombre, :descripcionp, :conjPlatos, :conjPrecios
        def initialize(nombre, &block)
            @nombre = nombre
            @descripcionp = ""
            @conjPlatos = []
            @conjPrecios = []

            if block_given?  
                if block.arity == 1
                  yield self
                else
                 instance_eval(&block) 
                end
              end
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