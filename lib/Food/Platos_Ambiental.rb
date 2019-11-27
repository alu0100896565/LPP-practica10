module Food

    class Platos_Ambiental < Platos

    def initiaize(nombre) 
        super(nombre)
    end

    def emisiones
        (Platos.instance_method(:alim_total).bind(self).call).emisiones
    end

    def terreno
        (Platos.instance_method(:alim_total).bind(self).call).terreno
    end

    def efiEn
        x = "Para crear el plato: #{@nombre}, se generan "
        x += (Platos.instance_method(:alim_total).bind(self).call).emisiones.to_s
        x += " de emisiones de CO2 y "
        x += (Platos.instance_method(:alim_total).bind(self).call).terreno.to_s
        x += " de metros cuadrados de terreno"
    end

    end
end