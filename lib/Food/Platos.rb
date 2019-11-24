module Food

class Platos
attr_reader :nombre, :ali_list, :gram_list
def initialize(nombre)
    @nombre = nombre
    @ali_list = List.new
    @gram_list = List.new

end

end

end