RSpec.describe Food do
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end
end

RSpec.describe Food::Alimentos do
  before (:all) do        
    @lentejas = Food::Alimentos.new({ :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4})
    @carneVaca = Food::Alimentos.new({ :nombre => "Carne de vaca", :prot => 21.1, :carbs => 0.0, :lip => 3.1, :emisiones => 50.0, :terreno => 164.0})
    @carneCordero = Food::Alimentos.new({ :nombre => "Carne de cordero", :prot => 18.0, :carbs => 0.0, :lip => 17.0, :emisiones => 20.0, :terreno => 185.0})
    @camarones = Food::Alimentos.new({ :nombre => "Camarones", :prot => 17.6, :carbs => 1.5, :lip => 0.6, :emisiones => 18.0, :terreno => 2.0})
    @chocolate = Food::Alimentos.new({ :nombre => "Chocolate", :prot => 5.3, :carbs => 47.0, :lip => 30.0, :emisiones => 2.3, :terreno => 3.4})
    @salmon = Food::Alimentos.new({ :nombre => "Salmon", :prot => 19.9, :carbs => 0.0, :lip => 13.6, :emisiones => 6.0, :terreno => 3.7})
    @cerdo = Food::Alimentos.new({ :nombre => "Cerdo", :prot => 21.5, :carbs => 0.0, :lip => 6.3, :emisiones => 7.6, :terreno => 11.0})
    @pollo = Food::Alimentos.new({ :nombre => "Pollo", :prot => 20.6, :carbs => 0.0, :lip => 5.6, :emisiones => 5.7, :terreno => 7.1})
    @queso = Food::Alimentos.new({ :nombre => "Queso", :prot => 25.0, :carbs => 1.3, :lip => 33.0, :emisiones => 11.0, :terreno => 41.0})
    @cerveza = Food::Alimentos.new({ :nombre => "Cerveza", :prot => 0.5, :carbs => 3.6, :lip => 0.0, :emisiones => 0.24, :terreno => 0.22})
    @leche = Food::Alimentos.new({ :nombre => "Leche de vaca", :prot => 3.3, :carbs => 4.8, :lip => 3.2, :emisiones => 3.2, :terreno => 8.9})
    @huevos = Food::Alimentos.new({ :nombre => "Huevos", :prot => 13.0, :carbs => 1.1, :lip => 11.0, :emisiones => 4.2, :terreno => 5.7})
    @cafe = Food::Alimentos.new({ :nombre => "Cafe", :prot => 0.1, :carbs => 0.0, :lip => 0.0, :emisiones => 0.4, :terreno => 0.3})
    @tofu = Food::Alimentos.new({ :nombre => "Tofu", :prot => 8.0, :carbs => 1.9, :lip => 4.8, :emisiones => 2.0, :terreno => 2.2})
    @nuez = Food::Alimentos.new({ :nombre => "Nuez", :prot => 20.0, :carbs => 21.0, :lip => 54.0, :emisiones => 0.3, :terreno => 7.9})
    @comidita = [@lentejas, @pollo, @nuez, @tofu, @queso, @huevos, @salmon, @chocolate, @cafe, @cerveza, @carneVaca, @carneCordero, @salmon, @leche]
    @dietita = Food::Dieta.new("Dietita", "hombre", @comidita)
    @nodo = Food::Node.new(0,nil,nil)
    @lista = Food::List.new()
    @nodo1 = Food::Node.new(1,nil,nil)
    @nodo2 = Food::Node.new(2,nil,nil)
    @nodo3 = Food::Node.new(3,nil,nil)
    @nodoArray = [@nodo1, @nodo2, @nodo3]

  end

  context "Probando la clase Alimentos" do
    it "Se ha de poder instanciar un alimento" do
      expect(@lentejas.instance_of? Food::Alimentos).to eq(true)
    end

    it "Debe existir un nombre para el alimento" do
      expect(@lentejas.nombre).to eq("lentejas")
    end

    it "Debe existir un atributo con las emisiones" do
      expect(@lentejas.emisiones).to eq(0.4)
    end

    it "Debe existir un atributo con la cantidad de terreno usada" do
      expect(@lentejas.terreno).to eq(3.4)
    end

    it "Debe existir un metodo para obtener el aimento formateado" do
      expect(@lentejas.to_s).to eq("lentejas: { prot: 23.5, carbs: 52.0, lip: 1.4, emisiones: 0.4, terreno: 3.4 }")
    end

    it "Debe existir un metodo para calcular el valor energetico de un Alimento" do
      expect(@lentejas.valorEnergetico).to eq(314.6)
    end

    it "Debe ser posible sumar comidas para sumar sus valores de nutrientes e impacto ambiental" do
      expect((@lentejas+@lentejas).valorEnergetico).to eq(629.2)
    end
    
end
end

RSpec.describe Food::Dieta do

    before(:all) do
      @lentejas = Food::Alimentos.new({ :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4})
    @carneVaca = Food::Alimentos.new({ :nombre => "Carne de vaca", :prot => 21.1, :carbs => 0.0, :lip => 3.1, :emisiones => 50.0, :terreno => 164.0})
    @carneCordero = Food::Alimentos.new({ :nombre => "Carne de cordero", :prot => 18.0, :carbs => 0.0, :lip => 17.0, :emisiones => 20.0, :terreno => 185.0})
    @camarones = Food::Alimentos.new({ :nombre => "Camarones", :prot => 17.6, :carbs => 1.5, :lip => 0.6, :emisiones => 18.0, :terreno => 2.0})
    @chocolate = Food::Alimentos.new({ :nombre => "Chocolate", :prot => 5.3, :carbs => 47.0, :lip => 30.0, :emisiones => 2.3, :terreno => 3.4})
    @salmon = Food::Alimentos.new({ :nombre => "Salmon", :prot => 19.9, :carbs => 0.0, :lip => 13.6, :emisiones => 6.0, :terreno => 3.7})
    @cerdo = Food::Alimentos.new({ :nombre => "Cerdo", :prot => 21.5, :carbs => 0.0, :lip => 6.3, :emisiones => 7.6, :terreno => 11.0})
    @pollo = Food::Alimentos.new({ :nombre => "Pollo", :prot => 20.6, :carbs => 0.0, :lip => 5.6, :emisiones => 5.7, :terreno => 7.1})
    @queso = Food::Alimentos.new({ :nombre => "Queso", :prot => 25.0, :carbs => 1.3, :lip => 33.0, :emisiones => 11.0, :terreno => 41.0})
    @cerveza = Food::Alimentos.new({ :nombre => "Cerveza", :prot => 0.5, :carbs => 3.6, :lip => 0.0, :emisiones => 0.24, :terreno => 0.22})
    @leche = Food::Alimentos.new({ :nombre => "Leche de vaca", :prot => 3.3, :carbs => 4.8, :lip => 3.2, :emisiones => 3.2, :terreno => 8.9})
    @huevos = Food::Alimentos.new({ :nombre => "Huevos", :prot => 13.0, :carbs => 1.1, :lip => 11.0, :emisiones => 4.2, :terreno => 5.7})
    @cafe = Food::Alimentos.new({ :nombre => "Cafe", :prot => 0.1, :carbs => 0.0, :lip => 0.0, :emisiones => 0.4, :terreno => 0.3})
    @tofu = Food::Alimentos.new({ :nombre => "Tofu", :prot => 8.0, :carbs => 1.9, :lip => 4.8, :emisiones => 2.0, :terreno => 2.2})
    @nuez = Food::Alimentos.new({ :nombre => "Nuez", :prot => 20.0, :carbs => 21.0, :lip => 54.0, :emisiones => 0.3, :terreno => 7.9})
    @comidita = [@lentejas, @pollo, @nuez, @tofu, @queso, @huevos, @salmon, @chocolate, @cafe, @cerveza, @carneVaca, @carneCordero, @salmon, @leche]
    @dietita = Food::Dieta.new("Dietita", "hombre", @comidita)
    end
   context "Probando la clase Dieta" do
    it "Se ha de poder instanciar una dieta" do
      expect(@dietita.instance_of? Food::Dieta).to eq(true)
    end

    it "Una dieta debe tener un Nombre" do
      expect(@dietita.respond_to?(:nombre)).to eq(true)
  end

  it "Una dieta esta dirigida a un genero" do
    expect(@dietita.respond_to?(:genero)).to eq(true)
end

it "Una dieta debe contener alimentos" do
  expect(@dietita.respond_to?(:alimentos)).to eq(true)
end

it "Se debe comprobar la suma de los valores de los alimentos de la dieta" do

  @lentejitas = [@lentejas, @lentejas]
  @dietaLentejas = Food::Dieta.new("Dietita", "hombre", @lentejitas)
  
  @dietaLentejas.sumaAlimentos

  expect(@dietaLentejas.alimentoTotal.prot).to eq(47.0)
  expect(@dietaLentejas.alimentoTotal.carbs).to eq(104.0)
  expect(@dietaLentejas.alimentoTotal.lip).to eq(2.8)
  expect(@dietaLentejas.alimentoTotal.emisiones).to eq(0.8)
  expect(@dietaLentejas.alimentoTotal.terreno).to eq(6.8)
end

it "Comprobar si la Alimentacion de la dieta cumple con el IDR para el género" do
  
  @dietita.sumaAlimentos

  expect(@dietita.idr).to eq(true)
end

it "Comprobar el impacto ambiental de la dieta" do

  expect(@dietita.alimentoTotal.emisiones).to eq(111.74)
  expect(@dietita.alimentoTotal.terreno).to eq(436.52)

end

it "Desarrollar un metodo para obtener el impacto ambiental de la dieta formateado" do

  expect(@dietita.impactoAmbiental).to eq("Para la dieta Dietita las emisiones de gases kgCO2eq son: 111.74 y el terreno usado en m2 por año es: 436.52")

end

it "Probar diferentas dietas para comprobar que superen el IDR y comprobar su impacto" do

  @dietaCarneArray = [@cerdo, @pollo, @carneCordero, @carneVaca, @queso, @huevos, @leche, @pollo, @cerdo, @cerdo, @cerdo, @carneCordero,
     @carneCordero, @queso, @leche, @carneVaca, @pollo, @cerdo]
  @dietaCarne = Food::Dieta.new("Dieta basada en carne", "hombre", @dietaCarneArray)
  @dietaCarne.sumaAlimentos
  expect(@dietaCarne.alimentoTotal.valorEnergetico).to eq(3093.7)
  expect(@dietaCarne.alimentoTotal.prot).to eq(335.1)
  expect(@dietaCarne.idr).to eq(true)
  expect(@dietaCarne.alimentoTotal.emisiones).to eq(247.7)
  expect(@dietaCarne.alimentoTotal.terreno).to eq(1064.8)

  @dietaVeganaArray = [@lentejas, @nuez, @tofu, @chocolate, @cafe, @nuez, @tofu, @tofu, @lentejas, @chocolate]
  @dietaVegana = Food::Dieta.new("Dieta Vegana", "hombre", @dietaVeganaArray)
  @dietaVegana.sumaAlimentos
  expect(@dietaVegana.alimentoTotal.valorEnergetico).to eq(3136.4)
  expect(@dietaVegana.alimentoTotal.prot).to eq(121.7)
  expect(@dietaVegana.idr).to eq(true)
  expect(@dietaVegana.alimentoTotal.emisiones).to eq(12.4)
  expect(@dietaVegana.alimentoTotal.terreno).to eq(36.3)

end

end
end

RSpec.describe Food::List do
  before(:all) do
    @nodo = Food::Node.new(0,nil,nil)
    @lista = Food::List.new()
    @nodo1 = Food::Node.new(1,nil,nil)
    @nodo2 = Food::Node.new(2,nil,nil)
    @nodo3 = Food::Node.new(3,nil,nil)
    @nodoArray = [@nodo1, @nodo2, @nodo3]
  end

context "Probando la estructura Node " do

  it "Existe la estructura Node" do
    expect(@nodo.instance_of? Food::Node).to eq true
  end

  it "La estructura Node tiene los atributos dato, siguiente y previo" do

    expect(@nodo.respond_to?:value).to eq(true)
    expect(@nodo.respond_to?:next).to eq(true)
    expect(@nodo.respond_to?:prev).to eq(true)
  
  end
end

context "Probando la clase List" do

  it "Existe la clase lista" do
    expect(@lista.instance_of? Food::List).to eq(true)
  end

  it "La clase List tiene cabeza y cola" do
    expect(@lista.respond_to?:head).to eq(true)
    expect(@lista.respond_to?:tail).to eq(true)
  end

  it "Se puede insertar un elemento en la lista" do
    expect(@lista.respond_to?:insert_head).to eq(true)
    expect(@lista.respond_to?:insert_tail).to eq(true)
  
  end

  it "Los metodos de insertar funcionan correctamente" do

  
    @lista.insert_head(@nodo1)
    expect(@lista.head.value).to eq(1)
    @lista.insert_tail(@nodo2)
    expect(@lista.tail.value).to eq(2)
  
  end

  it "Se puede insertar varios elemento en la lista" do
    expect(@lista.respond_to?:insert_various_head).to eq(true)
    expect(@lista.respond_to?:insert_various_tail).to eq(true)
  
  end

  it "Los metodos de insertar varios funcionan correctamente" do

  
    @lista1 = Food::List.new()
    @lista1.insert_various_head(@nodoArray)
    expect(@lista1.head.value).to eq(3)
    expect(@lista1.tail.value).to eq(1)
    @lista1.insert_various_tail(@nodoArray)
    expect(@lista1.head.value).to eq(3)
    expect(@lista1.tail.value).to eq(3)
  
  end

  it "Se pueden extraer exlementos de la cabeza de la lista" do
    expect(@lista.respond_to?:extract_head).to eq(true)
    expect(@lista.extract_head.value).to eq(1)
    expect(@lista.extract_head.value).to eq(2)
  end

  it "Se pueden extraer exlementos de la cola de la lista" do
    expect(@lista.respond_to?:extract_tail).to eq(true)
    @lista2 = Food::List.new()
    expect(@lista2.empty).to eq(true)
    @lista2.insert_head(@nodo1)
    @lista2.insert_tail(@nodo2)
    expect(@lista2.recorrerLista).to eq(" 1 2")
    expect(@lista2.extract_tail.value).to eq(2)
    expect(@lista2.extract_tail.value).to eq(1)
    
  end

end

end
