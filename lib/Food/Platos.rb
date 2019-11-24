module Food

class Platos
attr_reader :nombre, :ali_list, :gram_list
def initialize(nombre)
    @nombre = nombre
    @ali_list = List.new
    @gram_list = List.new

end

def insert_alimH(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer

    @ali_list.insert_head(alim)
    @gram_list.insert_head(gram)
end

def insert_alimT(alim, gram)
    raise TypeError, "Se espera como argumento un alimento" unless alim.is_a?Alimentos
    raise TypeError, "Se espera como argumento un entero" unless gram.is_a?Integer

    @ali_list.insert_tail(alim)
    @gram_list.insert_tail(gram)
end

end

end