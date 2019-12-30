# encoding: utf-8
# Este módulo se ha creado para describir
# el comportamiento tanto de alimentos
# como de platos formados por ellos mediante
# listas de los mismos, centrandose en su
# informacion nutricional y su huella ambiental.
#
# Author::    Eduardo Suarez Ojeda  (mailto:alu0100896565@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby
module Food

    # Clase que representa los platos centrandose
    # en su información ambiental.
    # Es hija de la clase Platos.
    class Platos_Ambiental < Platos

    # Inicializacion con el nombre del plato.
    def initiaize(nombre, &block) 
        super(nombre)

    end

    # Se define el operador <=> para hacer uso del modulo Comparable sobreescribiendo el de la clase padre.
    # Se compara en base a la huella nutricional.
    def <=>(anOther)
        if not anOther.is_a? Platos
            return nil
              end
              self.huella_nutricional <=> anOther.huella_nutricional
    end

    # Obtiene las emisiones necesarias para producir el plato.
    def emisiones
        (Platos.instance_method(:alim_total).bind(self).call).emisiones
    end

    # Obtiene el terreno necesario para producir el plato.
    def terreno
        (Platos.instance_method(:alim_total).bind(self).call).terreno
    end

    # Obtiene la eficiencia energetica del plato.
    def efEner
        self.alim_total.emisiones+self.alim_total.terreno
    end

    # Obtiene la eficiencia energética formateada como cadena.
    def efiEn
        x = "Para crear el plato: #{@nombrep}, se generan "
        x += (Platos.instance_method(:alim_total).bind(self).call).emisiones.to_s
        x += " de emisiones de CO2 y "
        x += (Platos.instance_method(:alim_total).bind(self).call).terreno.to_s
        x += " de metros cuadrados de terreno"
    end

    # Calcula el indice de impacto de carbono del plato.
    def impacto_carbono
        if emisiones < 0.8 then
            return 1
        elsif emisiones < 1.2 then
            return 2
        else 3 
        end
    end

    # Calcula la huella nutricional del plato.
    def huella_nutricional
        x = impacto_energetico
        y = impacto_carbono
        (x+y) / 2.0
    end

    end
end


