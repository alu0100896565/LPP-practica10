module Food

class Dieta_Plato

def initialize(nombre)

    @nombre = nombre
    @plato_list = List.new
end

def insert_platH(plato)
    @plato_list.insert_head(plato)
end

def getHead
    @plato_list.head.value
end

end


end