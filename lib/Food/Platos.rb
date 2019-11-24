module Food

class Platos
attr_reader :nombre, :ali_list, :gram_list, :alim_total
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



end

end