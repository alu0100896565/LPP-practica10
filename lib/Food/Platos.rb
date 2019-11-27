module Food

class Platos
attr_reader :nombre, :ali_list, :gram_list
def initialize(nombre)
    @nombre = nombre
    @ali_list = List.new
    @gram_list = List.new
    @alim_total = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
end

def insert_alimH(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer
    @ali_list.insert_head(alim)
    @gram_list.insert_head(gram)
    alim=alim*(gram)
    @alim_total += alim

end

def insert_alimT(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer 
    @ali_list.insert_tail(alim)
    @gram_list.insert_tail(gram)
    alim=alim*(gram)
    @alim_total += alim
end

def protsPorcent
    (((@alim_total.prot * 4) / @alim_total.valorEnergetico) * 100.00).round(3)
end

def lipsPorcent
    (((@alim_total.lip * 9) / @alim_total.valorEnergetico) * 100.00).round(3)
end

def carbsPorcent
    (((@alim_total.carbs * 4) / @alim_total.valorEnergetico) * 100.00).round(3)
end

def vct
    @alim_total.valorEnergetico
end

def to_s
    x="#{@nombre}, prot: #{@alim_total.prot}, carbs: #{@alim_total.carbs}, lip: #{@alim_total.lip}, emisiones: #{@alim_total.emisiones}, terreno: #{@alim_total.terreno}, VCT: #{@alim_total.valorEnergetico}."
    y=" Compuesto por: "
    lista2 = ali_list.zip(gram_list)
    lista2.cycle(1){ |z| y+=z[0].nombre + ", " + z[1].to_s + " gramos, "}
    y = y[0..(y.length-3)]
    x + y
end

def proteins
    @alim_total.prot
end

def lipids
    alim_total.lip
end

def carbohidrats
    alim_total.carbs
end

private def alim_total
    @alim_total
end

end

end