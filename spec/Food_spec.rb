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
    

  end

  context "Probando la clase Alimentos: atributos" do
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
  end
  context "Probando la clase Alimentos: metodos" do
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
    context "Añadiendo Comparable a la clase Alimentos" do
      it "El mixin Comparable esta incluido en la clase Alimentos" do
        expect(Food::Alimentos.ancestors.select {|o| o.class == Module }).to eq([Comparable, Kernel])       
        end

      it "Se ha sobrecargado el operador <=>" do
        expect(@lentejas<=>@leche).to eq(1)
      end

      it "Pruebas de los operadores de Comparable" do
        expect(@lentejas>@leche).to eq(true)
        expect(@cafe<@pollo).to eq(true)
        expect(@lentejas==@lentejas).to eq(true)
        expect(@lentejas>=@carneVaca).to eq(true)
        expect(@carneCordero<=@lentejas).to eq(true)
        expect(@tofu.between?(@cafe, @lentejas)).to eq(true)
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
   context "Probando la clase Dieta: atributos" do
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
end

context "Probando la clase Dieta: metodos" do
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
    
    @array = [1, 2, 3]
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

context "Probando la clase List: atributos" do

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
end

  context "Probando la clase List: metodos" do

  it "Los metodos de insertar funcionan correctamente" do

  
    @lista.insert_head(1)
    expect(@lista.head.value).to eq(1)
    @lista.insert_tail(2)
    expect(@lista.tail.value).to eq(2)
  
  end

  it "Se puede insertar varios elemento en la lista" do
    expect(@lista.respond_to?:insert_various_head).to eq(true)
    expect(@lista.respond_to?:insert_various_tail).to eq(true)
  
  end

  it "Los metodos de insertar varios funcionan correctamente" do

  
    @lista1 = Food::List.new()
    @lista1.insert_various_head(@array)
    expect(@lista1.head.value).to eq(3)
    expect(@lista1.tail.value).to eq(1)
    @lista1.insert_various_tail(@array)
    expect(@lista1.head.value).to eq(3)
    expect(@lista1.tail.value).to eq(3)
  
  end

  it "Se pueden extraer exlementos de la cabeza de la lista" do
    expect(@lista.respond_to?:extract_head).to eq(true)
    expect(@lista.extract_head).to eq(1)
    expect(@lista.extract_head).to eq(2)
  end

  it "Se pueden extraer exlementos de la cola de la lista" do
    expect(@lista.respond_to?:extract_tail).to eq(true)
    @lista2 = Food::List.new()
    expect(@lista2.empty).to eq(true)
    @lista2.insert_head(1)
    @lista2.insert_tail(2)
    expect(@lista2.recorrerLista).to eq(" 1 2")
    expect(@lista2.extract_tail).to eq(2)
    expect(@lista2.extract_tail).to eq(1)
    
  end

end

context "Añadiendo Enumerable a la clase List" do
  it "Comprobar que se añade el mixin Enumerable en la clase List" do
    expect(Food::List.ancestors.select {|o| o.class == Module }).to eq([Enumerable, Kernel])
  end

  it "Añadiendo el metodo each en List" do
    expect(@lista.respond_to?:each).to eq(true)
  end

  it "El metodo each esta implementado correctamente" do
    x = 0
    @lista2 = Food::List.new()
    expect(@lista2.empty).to eq(true)
    @lista2.insert_head(1)
    @lista2.insert_tail(2)
    @lista2.each { |i| x+=i}
    expect(x).to eq(3)
  end
end

end

RSpec.describe Food::Dieta_lista do
  before(:all) do
    
    @dietaL = Food::Dieta_lista.new("Dieta de prueba", "hombre")
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

    @dietaE = Food::Dieta_lista.new("Dieta Enumerable", "mujer")
  end

context "Probando la clase Dieta_lista: atributos" do

it "Existe la clase Dieta_lista" do
  expect(@dietaL.instance_of? Food::Dieta_lista).to eq(true)
end

it "La clase Dieta_lista es hija de la clase List" do
  expect(Food::Dieta_lista.superclass).to eq(Food::List)
end
end

context "Probando la clase Dieta_lista: metodos" do
it "La clase Dieta_lista debe poder insertar alimentos por cabeza y cola" do
  @dietaL.insert_headS(@lentejas)
  @dietaL.insert_tailS(@pollo)
end

it "Comprobar que los metodos introducidos concuerdan" do
  expect(@dietaL.extract_head.to_s).to eq(@lentejas.to_s)
  expect(@dietaL.extract_tail.to_s).to eq(@pollo.to_s)
end

it "Crear el metodo suma_total para sumar todos los alimentos de la lista" do
  expect(@dietaL.respond_to?:suma_total).to eq(true)
end

it "Probar el metodo suma_total para sumar todos los alimentos de la lista" do
  @dietaL.insert_headS(@lentejas)
  @dietaL.insert_tailS(@pollo)
  @dietaL.suma_total
  expect(@dietaL.alimentoTotal.prot).to eq(44.10)
  expect(@dietaL.alimentoTotal.carbs).to eq(52.00)
  expect(@dietaL.alimentoTotal.lip).to eq(7.00)
  expect(@dietaL.alimentoTotal.emisiones).to eq(6.10)
  expect(@dietaL.alimentoTotal.terreno).to eq(10.50)
  expect(@dietaL.alimentoTotal.valorEnergetico).to eq(447.4)
end

it "Probar el metodo que comprueba si se cumple el IDR" do
  expect(@dietaL.idr).to eq(false)
end

it "Probar el metodo que muestra el porcentaje de energia obtenido por cada tipo de nutriente" do
  expect(@dietaL.porcentajes).to eq("Proteinas: 39.428%, Carbohidratos: 46.491%, Lipidos: 14.081%.")
end

it "Crear metodos para comprobar las emisiones de la dieta y el terreno usado diariamente" do
  expect(@dietaL.alimentoTotal.emisiones).to eq(6.10)
  expect(@dietaL.alimentoTotal.terreno).to eq(10.50)
end

it "Crear el metodo para observar las emisiones anuales de la dieta" do
  expect(@dietaL.emisionesAnuales).to eq(2226.50)
end

end

context "Probando las diferentes dietas" do
  it "Probando la dieta española" do
    @dietaEsp = Food::Dieta_lista.new("Dieta Española", "mujer")
    @dietaEsp.insert_headS(@lentejas)
    @dietaEsp.insert_headS(@cerdo)
    @dietaEsp.insert_headS(@chocolate)
    @dietaEsp.insert_headS(@carneCordero)
    @dietaEsp.insert_headS(@chocolate)
    @dietaEsp.insert_headS(@lentejas)
    @dietaEsp.insert_headS(@lentejas)
    @dietaEsp.insert_headS(@cerdo)
    @dietaEsp.insert_headS(@leche)
    

    @dietaEsp.suma_total
    #expect(@dietaEsp.alimentoTotal.valorEnergetico).to eq(447.4)
    expect(@dietaEsp.idr).to eq(true)
    expect(@dietaEsp.porcentajes).to eq("Proteinas: 23.51%, Carbohidratos: 41.2%, Lipidos: 35.29%.")
    expect(@dietaEsp.alimentoTotal.emisiones).to eq(44.2)
    expect(@dietaEsp.alimentoTotal.terreno).to eq(232.9)
    expect(@dietaEsp.emisionesAnuales).to eq(16133.0)
  end

  it "Probando la dieta vasca" do
    @dietaVas = Food::Dieta_lista.new("Dieta Vasca", "mujer")
    @dietaVas.insert_headS(@lentejas)
    @dietaVas.insert_headS(@lentejas)
    @dietaVas.insert_headS(@lentejas)
    @dietaVas.insert_headS(@chocolate)
    @dietaVas.insert_headS(@lentejas)
    @dietaVas.insert_headS(@lentejas)
    @dietaVas.insert_headS(@chocolate)
    

    @dietaVas.suma_total
    #expect(@dietaVas.alimentoTotal.valorEnergetico).to eq(447.4)
    expect(@dietaVas.idr).to eq(true)
    expect(@dietaVas.porcentajes).to eq("Proteinas: 20.242%, Carbohidratos: 55.937%, Lipidos: 23.821%.")
    expect(@dietaVas.alimentoTotal.emisiones).to eq(6.6)
    expect(@dietaVas.alimentoTotal.terreno).to eq(23.8)
    expect(@dietaVas.emisionesAnuales).to eq(2409.0)
  end

  it "Probando la dieta vegetariana" do
    @dietaVeg = Food::Dieta_lista.new("Dieta Vegetariana", "mujer")
    @dietaVeg.insert_headS(@lentejas)
    @dietaVeg.insert_headS(@leche)
    @dietaVeg.insert_headS(@chocolate)
    @dietaVeg.insert_headS(@huevos)
    @dietaVeg.insert_headS(@chocolate)
    @dietaVeg.insert_headS(@lentejas)
    @dietaVeg.insert_headS(@lentejas)
    @dietaVeg.insert_headS(@leche)
    @dietaVeg.insert_headS(@leche)
    @dietaVeg.insert_headS(@leche)
    

    @dietaVeg.suma_total
    #expect(@dietaVeg.alimentoTotal.valorEnergetico).to eq(447.4)
    expect(@dietaVeg.idr).to eq(true)
    expect(@dietaVeg.porcentajes).to eq("Proteinas: 18.641%, Carbohidratos: 46.96%, Lipidos: 34.399%.")
    expect(@dietaVeg.alimentoTotal.emisiones).to eq(22.8)
    expect(@dietaVeg.alimentoTotal.terreno).to eq(58.3)
    expect(@dietaVeg.emisionesAnuales).to eq(8322.0)
  end

  it "Probando la dieta vegetaliana" do
    @dietaVegl = Food::Dieta_lista.new("Dieta Vegetaliana", "mujer")
    @dietaVegl.insert_headS(@lentejas)
    @dietaVegl.insert_headS(@chocolate)    
    @dietaVegl.insert_headS(@chocolate)
    @dietaVegl.insert_headS(@lentejas)
    @dietaVegl.insert_headS(@lentejas)
    @dietaVegl.insert_headS(@lentejas)
    @dietaVegl.insert_headS(@tofu)
    @dietaVegl.insert_headS(@cafe)



    @dietaVegl.suma_total
    #expect(@dietaVegl.alimentoTotal.valorEnergetico).to eq(2300.0)
    expect(@dietaVegl.idr).to eq(true)
    expect(@dietaVegl.porcentajes).to eq("Proteinas: 19.6%, Carbohidratos: 52.852%, Lipidos: 27.548%.")
    expect(@dietaVegl.alimentoTotal.emisiones).to eq(8.6)
    expect(@dietaVegl.alimentoTotal.terreno).to eq(22.9)
    expect(@dietaVegl.emisionesAnuales).to eq(3139.0)
  end

  it "Probando la dieta  locura por la carne" do
    @dietaCar = Food::Dieta_lista.new("Dieta Carne", "mujer")
    @dietaCar.insert_headS(@cerdo)
    @dietaCar.insert_headS(@carneCordero)
    @dietaCar.insert_headS(@carneVaca)
    @dietaCar.insert_headS(@pollo)
    @dietaCar.insert_headS(@cerdo)
    @dietaCar.insert_headS(@carneCordero)
    @dietaCar.insert_headS(@carneVaca)
    @dietaCar.insert_headS(@pollo)
    @dietaCar.insert_headS(@chocolate)
    @dietaCar.insert_headS(@chocolate)
    @dietaCar.insert_headS(@lentejas)

    @dietaCar.suma_total
    #expect(@dietaCar.alimentoTotal.valorEnergetico).to eq(2300.0)
    expect(@dietaCar.idr).to eq(true)
    expect(@dietaCar.porcentajes).to eq("Proteinas: 31.458%, Carbohidratos: 23.373%, Lipidos: 45.169%.")
    expect(@dietaCar.alimentoTotal.emisiones).to eq(171.6)
    expect(@dietaCar.alimentoTotal.terreno).to eq(744.4)
    expect(@dietaCar.emisionesAnuales).to eq(62634.0)
  end

end

context "Probando los metodos de Enumerable en la clase Dieta_lista"
it "Metodo collect" do
  @dietaE.insert_headS(@lentejas)
  @dietaE.insert_headS(@pollo)
  expect(@dietaE.collect { "cat"}).to eq(["cat", "cat"])
end

it "Metodo select" do
  expect(@dietaE.select { |i| i.emisiones < 1}).to eq([@lentejas])
end

it "Metodo max" do
  expect(@dietaE.max).to eq(@lentejas)
end

it "Metodo min" do
  expect(@dietaE.min).to eq(@pollo)
end

it "Metodo sort" do
  expect(@dietaE.sort).to eq([@pollo, @lentejas])
end

end

RSpec.describe Food::Platos do
  before (:all) do
    @plato = Food::Platos.new("Ejemplo")
end

context "Probando la clase Platos: atributos" do

it "Los platos deben tener nombre" do
  expect(@plato.respond_to?:nombre).to eq(true)
end

it "Los platos tienen una lista de aimentos" do
  expect(@plato.respond_to?:ali_list).to eq(true)
end

it "Los platos tienen una lista de cantidades de alimento en gramos" do
  expect(@plato.respond_to?:gram_list).to eq(true)
end

it "Se pueden añidir alimentos a los platos" do
  expect(@plato.respond_to?:insert_alimH).to eq(true)
  expect(@plato.respond_to?:insert_alimT).to eq(true)

end

end

end
