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

    # Esta clase representa un plato como un 
    # conjunto de alimentos y sus cantidades.
    # Incluye el mixin Comparable.
class Platos
    
    include Comparable

attr_reader :nombre, :ali_list, :gram_list
    # Se inicializa el plato con su nombre.
def initialize(nombre)
    @nombre = nombre
    @ali_list = List.new
    @gram_list = List.new
    @alim_total = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
end

# Se define el operador <=> para hacer uso del modulo Comparable.
# Se compara en base al valor calorico total.
def <=>(anOther)
    if not anOther.is_a? Platos
        return nil
          end
          self.vct <=> anOther.vct
end

# Inserta un alimento y su cantidad en las listas por la cabeza.
def insert_alimH(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer
    @ali_list.insert_head(alim)
    @gram_list.insert_head(gram)
    alim=alim*(gram)
    @alim_total += alim

end

# Inserta un alimento y su cantidad en las listas por la cola.
def insert_alimT(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer 
    @ali_list.insert_tail(alim)
    @gram_list.insert_tail(gram)
    alim=alim*(gram)
    @alim_total += alim
end

# Obtiene el porcentaje de calorias aportadas por proteinas.
def protsPorcent
    (((@alim_total.prot * 4) / @alim_total.valorEnergetico) * 100.00).round(3)
end

# Obtiene el porcentaje de calorias aportadas por grasas.
def lipsPorcent
    (((@alim_total.lip * 9) / @alim_total.valorEnergetico) * 100.00).round(3)
end

# Obtiene el porcentaje de calorias aportadas por carbohidratos.
def carbsPorcent
    (((@alim_total.carbs * 4) / @alim_total.valorEnergetico) * 100.00).round(3)
end

# Calcula el valor calorico total del plato
def vct
    @alim_total.valorEnergetico
end

# Genera en forma de cadena el plato formateado
def to_s
    x="#{@nombre}, prot: #{@alim_total.prot}, carbs: #{@alim_total.carbs}, lip: #{@alim_total.lip}, emisiones: #{@alim_total.emisiones}, terreno: #{@alim_total.terreno}, VCT: #{@alim_total.valorEnergetico}."
    y=" Compuesto por: "
    lista2 = ali_list.zip(gram_list)
    lista2.cycle(1){ |z| y+=z[0].nombre + ", " + z[1].to_s + " gramos, "}
    y = y[0..(y.length-3)]
    x + y
end

# Devuelve la cantidad de proteinas del plato
def proteins
    @alim_total.prot
end

# Devuelve la cantidad de grasas del plato
def lipids
    alim_total.lip
end

# Devuelve la cantidad de carbohidratos del plato.
def carbohidrats
    alim_total.carbs
end

# Para que las clases hijas tengan acceso a la información nutricional y ambiental del plato.
protected def alim_total
    @alim_total
end

# Calcula el indice de impacto energetico del plato
def impacto_energetico
    if vct < 670 then
        return 1
    elsif vct < 830 then
        return 2
    else 3 
    end
end



end

end