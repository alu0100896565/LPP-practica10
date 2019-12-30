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
    
    @@arrayPlatos = []

    def self.arrayPlatos
        @@arrayPlatos
    end

    include Comparable

attr_accessor :nombrep, :ali_list, :gram_list, :descripcion
    # Se inicializa el plato con su nombre.
def initialize(nombre, &block)
    @nombrep = nombre
    @ali_list = List.new
    @gram_list = List.new
    @alim_total = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
    @descripcion = ""

    if block_given?  
        if block.arity == 1
          yield self
        else
         instance_eval(&block) 
        end
        self.class.arrayPlatos << self
      end
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
    x="#{@nombrep}, prot: #{@alim_total.prot}, carbs: #{@alim_total.carbs}, lip: #{@alim_total.lip}, emisiones: #{@alim_total.emisiones}, terreno: #{@alim_total.terreno}, VCT: #{@alim_total.valorEnergetico}."
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

def emisiones
    @alim_total.emisiones
end

def self.__alimento(nombre)
    lentejas = Food::Alimentos.new({ :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4})
    carneVaca = Food::Alimentos.new({ :nombre => "Carne de vaca", :prot => 21.1, :carbs => 0.0, :lip => 3.1, :emisiones => 50.0, :terreno => 164.0})
    carneCordero = Food::Alimentos.new({ :nombre => "Carne de cordero", :prot => 18.0, :carbs => 0.0, :lip => 17.0, :emisiones => 20.0, :terreno => 185.0})
    camarones = Food::Alimentos.new({ :nombre => "Camarones", :prot => 17.6, :carbs => 1.5, :lip => 0.6, :emisiones => 18.0, :terreno => 2.0})
    chocolate = Food::Alimentos.new({ :nombre => "Chocolate", :prot => 5.3, :carbs => 47.0, :lip => 30.0, :emisiones => 2.3, :terreno => 3.4})
    salmon = Food::Alimentos.new({ :nombre => "Salmon", :prot => 19.9, :carbs => 0.0, :lip => 13.6, :emisiones => 6.0, :terreno => 3.7})
    cerdo = Food::Alimentos.new({ :nombre => "Cerdo", :prot => 21.5, :carbs => 0.0, :lip => 6.3, :emisiones => 7.6, :terreno => 11.0})
    pollo = Food::Alimentos.new({ :nombre => "Pollo", :prot => 20.6, :carbs => 0.0, :lip => 5.6, :emisiones => 5.7, :terreno => 7.1})
    queso = Food::Alimentos.new({ :nombre => "Queso", :prot => 25.0, :carbs => 1.3, :lip => 33.0, :emisiones => 11.0, :terreno => 41.0})
    cerveza = Food::Alimentos.new({ :nombre => "Cerveza", :prot => 0.5, :carbs => 3.6, :lip => 0.0, :emisiones => 0.24, :terreno => 0.22})
    leche = Food::Alimentos.new({ :nombre => "Leche de vaca", :prot => 3.3, :carbs => 4.8, :lip => 3.2, :emisiones => 3.2, :terreno => 8.9})
    huevos = Food::Alimentos.new({ :nombre => "Huevos", :prot => 13.0, :carbs => 1.1, :lip => 11.0, :emisiones => 4.2, :terreno => 5.7})
    cafe = Food::Alimentos.new({ :nombre => "Cafe", :prot => 0.1, :carbs => 0.0, :lip => 0.0, :emisiones => 0.4, :terreno => 0.3})
    tofu = Food::Alimentos.new({ :nombre => "Tofu", :prot => 8.0, :carbs => 1.9, :lip => 4.8, :emisiones => 2.0, :terreno => 2.2})
    nuez = Food::Alimentos.new({ :nombre => "Nuez", :prot => 20.0, :carbs => 21.0, :lip => 54.0, :emisiones => 0.3, :terreno => 7.9})
    arrayAlimentos = [lentejas, carneVaca, carneCordero, camarones, chocolate, salmon, cerdo, pollo, queso, cerveza, leche, huevos, cafe, tofu, nuez]

      arrayAlimentos.find { |x| nombre == x.nombre }
    end

    def alimento(options = {})#(descripcion, gramos)
        if options[:descripcion]
        gramos = 100
        gramos = options[:gramos] if options[:gramos]
        alim = Platos_Ambiental.__alimento(options[:descripcion])
        insert_alimH(alim, gramos)
        else return nil
        end
    end

    def nombre(name)
        @descripcion = name
    end

end

end