module Food

    class Platos_Ambiental < Platos

    def initiaize(nombre) 
        super(nombre)
    end

    def emisiones
        (Platos.instance_method(:alim_total).bind(self).call).emisiones
    end

    end
end