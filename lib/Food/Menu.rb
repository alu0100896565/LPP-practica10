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

        def proteinas
            prots = 0
            @conjPlatos.map { |x| prots += x.proteins}
            prots.round(2)
        end

        def carbohidratos
            carbs = 0
            @conjPlatos.map { |x| carbs += x.carbohidrats}
            carbs.round(2)
        end

        def grasas
            gras = 0
            @conjPlatos.map { |x| gras += x.lipids}
            gras.round(2)
        end

        def vct
            kcal = 0
            @conjPlatos.map { |x| kcal += x.vct}
            kcal.round(2)
        end

        def emisionesMenu
            emis = 0
            @conjPlatos.map { |x| emis += x.emisiones}
            emis.round(2)
        end

        def terrenoMenu
            terr = 0
            @conjPlatos.map { |x| terr += x.terreno}
            terr.round(2)
        end

        

    end

end