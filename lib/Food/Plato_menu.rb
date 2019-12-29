module Food

    class Plato_menu < Platos_Ambiental

       

        def initialize (nombre)
            super(nombre)
        end

        def alimento(alim, gram)
            insert_alimH(alim, gram)
        end

    end

end