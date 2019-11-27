RSpec.describe Food do
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
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end


describe Food::Alimentos do
  

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

    it "Probando el operador *" do
      expect((@lentejas*200).prot).to eq(47)
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
        expect(@cafe.clamp(@tofu, @lentejas)).to eq(@tofu)
      end

      end
    end
    



describe Food::Dieta do

    before(:all) do
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

describe Food::List do
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

describe Food::Dieta_lista do
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

describe Food::Platos do
  before (:all) do
    @plato = Food::Platos.new("Ejemplo")
    @plato2 = Food::Platos.new("Ejemplo2")
    @plato3 = Food::Platos.new("Ejemplo3")
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
end
context "Probando la clase Platos: metodos" do

it "Se pueden añidir alimentos a los platos" do
  expect(@plato.respond_to?:insert_alimH).to eq(true)
  expect(@plato.respond_to?:insert_alimT).to eq(true)

end

it "Las funciones de insercion funcionan correctamente" do
  @plato.insert_alimH(@lentejas, 100)
  expect(@plato.ali_list.head.value).to eq(@lentejas)
  @plato.insert_alimT(@pollo, 100)
  expect(@plato.ali_list.tail.value).to eq(@pollo)
end

it "Se obtiene la suma total de los nutrientes" do
  expect(@plato.proteins).to eq(44.1)
end

it "Se obtiene el porcentaje de proteinas del conjunto de alimentos" do
  expect(@plato.protsPorcent).to eq(39.428)
end

it "Se obtienen los porcentajes de lipidos y hidratos del plato" do
  expect(@plato.lipsPorcent).to eq(14.081)
  expect(@plato.carbsPorcent).to eq(46.491)
end

it "Se obtiene el Valor Calorico Total del conjunto de alimentos" do
  expect(@plato.vct).to eq(447.4)
end

it "Se obtiene el plato formateado" do
  expect(@plato.to_s).to eq("Ejemplo, prot: 44.1, carbs: 52.0, lip: 7.0, emisiones: 6.1, terreno: 10.5, VCT: 447.4. Compuesto por: lentejas, 100 gramos, Pollo, 100 gramos")
end 

it "Los platos son comparables" do 
  @plato2.insert_alimH(@lentejas, 100)
  expect(@plato>@plato2).to eq(true)
end

it "Pruebas comparando Platos" do
    @plato3.insert_alimH(@cafe, 100)
    expect(@plato>@plato2).to eq(true)
    expect(@plato3<@plato2).to eq(true)
    expect(@plato==@plato).to eq(true)
    expect(@plato>=@plato3).to eq(true)
    expect(@plato3<=@plato2).to eq(true)
    expect(@plato2.between?(@plato3, @plato)).to eq(true)
    expect(@plato3.clamp(@plato2, @plato)).to eq(@plato2)

end

end

end

describe Food::Platos_Ambiental do
  before(:all) do
    @platoA = Food::Platos_Ambiental.new("Ejemplo")
    @platoA2 = Food::Platos_Ambiental.new("Ejemplo2")
    @platoA3 = Food::Platos_Ambiental.new("Ejemplo3")
    @platoEsp = Food::Platos_Ambiental.new("Cocido Extraño")
    @platoEspN = Food::Platos.new("Cocido Extraño")
    @platoEspN2 = Food::Platos.new("Plato esp2")
    @platoEspN3 = Food::Platos.new("Plato esp3")
    @platoVas = Food::Platos_Ambiental.new("Mucha cerveza")
    @platoVasN = Food::Platos.new("Mucha cerveza")
    @platoVasN2 = Food::Platos.new("plato Vas2")
    @platoVasN3 = Food::Platos.new("plato Vas3")
    @platoVeg = Food::Platos_Ambiental.new("Vegetariana")
    @platoVegN = Food::Platos.new("Vegetariana")
    @platoVegN2 = Food::Platos.new("plato Veg2")
    @platoVegN3 = Food::Platos.new("plato Veg3")
    @platoVega = Food::Platos_Ambiental.new("Vegetaliana")
    @platoVegaN = Food::Platos.new("Vegetaliana")
    @platoVegaN2 = Food::Platos.new("plato Vega2")
    @platoVegaN3 = Food::Platos.new("plato Vega3")
    @platoCar = Food::Platos_Ambiental.new("Locura por la carne")
    @platoCarN = Food::Platos.new("Locura por la carne")
    @platoCarN2 = Food::Platos.new("Locura por la carne2")
    @platoCarN3 = Food::Platos.new("Locura por la carne3")
    @listaEsp = Food::List.new
    @listaVas = Food::List.new
    @listaVeg = Food::List.new
    @listaVega = Food::List.new
    @listaCar = Food::List.new
  end

  context "Probando la clase Platos_Ambiental" do 

    it "La clase Platos_Ambiental es hija de la clase Platos" do
      expect(Food::Platos_Ambiental.superclass).to eq(Food::Platos)
    end

    it "platoA es una instancia de Platos_Ambiental" do 
      expect(@platoA.instance_of?Food::Platos_Ambiental).to eq(true)
    end

    it "platoA a su vez es un plato" do
      expect(@platoA.is_a?Food::Platos).to eq(true)
    end
  end
    context "Probando la clase Platos_Ambiental: metodos" do 
    it "Valor total de la emisiones diarias de de gases de efecto invernadero" do
      expect(@platoA.emisiones).to eq(0)
    end

    it "Estimaci´on de los metros cuadrados de uso de terreno" do
      expect(@platoA.terreno).to eq(0)
    end

    it "Se obtiene la eficiencia energetica formateada" do
      expect(@platoA.efiEn).to eq("Para crear el plato: Ejemplo, se generan 0.0 de emisiones de CO2 y 0.0 de metros cuadrados de terreno")
    end

    it "Los Platos_Ambiental deben ser comparables" do
      @platoA.insert_alimH(@lentejas, 100)
      @platoA2.insert_alimH(@cerdo, 100)
      expect(@platoA<@platoA2).to eq(true)
    end

    it "Pruebas comparando Platos_Ambientales" do
      @platoA3.insert_alimH(@cafe, 100)
      expect(@platoA<@platoA2).to eq(true)
      expect(@platoA3<@platoA2).to eq(true)
      expect(@platoA==@platoA).to eq(true)
      expect(@platoA>=@platoA3).to eq(true)
      expect(@platoA3<=@platoA2).to eq(true)
      expect(@platoA.between?(@platoA3, @platoA2)).to eq(true)
      expect(@platoA2.clamp(@platoA3, @platoA)).to eq(@platoA)

  end

  end
  context "Creando platos de dietas" do
    it "Creando plato de dieta Española" do
      
      @platoEsp.insert_alimH(@lentejas, 200)
      @platoEsp.insert_alimH(@chocolate, 90)
      @platoEsp.insert_alimH(@cerdo, 60)
      @platoEsp.insert_alimH(@nuez, 50)
      expect(@platoEsp.carbsPorcent).to eq(42.635)
      expect(@platoEsp.lipsPorcent).to eq(37.062)
      expect(@platoEsp.protsPorcent).to eq(20.303)
      @platoEspN.insert_alimH(@lentejas, 200)
      @platoEspN.insert_alimH(@chocolate, 90)
      @platoEspN.insert_alimH(@cerdo, 60)
      @platoEspN.insert_alimH(@nuez, 50)
    end

    it "Creando plato de dieta Vasca" do
      
      @platoVas.insert_alimH(@lentejas, 200)
      @platoVas.insert_alimH(@chocolate, 100)
      @platoVas.insert_alimH(@cerveza, 300)
      expect(@platoVas.carbsPorcent).to eq(55.909)
      expect(@platoVas.lipsPorcent).to eq(25.501)
      expect(@platoVas.protsPorcent).to eq(18.590)
      @platoVasN.insert_alimH(@lentejas, 200)
      @platoVasN.insert_alimH(@chocolate, 100)
      @platoVasN.insert_alimH(@cerveza, 300)
  end

    it "Creando plato de dieta Vegetaria" do
      
      @platoVeg.insert_alimH(@huevos, 30)
      @platoVeg.insert_alimH(@leche, 30)
      @platoVeg.insert_alimH(@chocolate, 70)
      @platoVeg.insert_alimH(@nuez, 70)
      @platoVeg.insert_alimH(@lentejas, 170)
      expect(@platoVeg.carbsPorcent).to eq(39.639)
      expect(@platoVeg.lipsPorcent).to eq(42.364)
      expect(@platoVeg.protsPorcent).to eq(17.997)
      @platoVegN.insert_alimH(@huevos, 30)
      @platoVegN.insert_alimH(@leche, 30)
      @platoVegN.insert_alimH(@chocolate, 70)
      @platoVegN.insert_alimH(@nuez, 70)
      @platoVegN.insert_alimH(@lentejas, 170)
    end

    it "Creando plato de dieta Vegetaria" do
      
      @platoVega.insert_alimH(@chocolate, 80)
      @platoVega.insert_alimH(@nuez, 70)
      @platoVega.insert_alimH(@lentejas, 190)
      expect(@platoVega.carbsPorcent).to eq(42.086)
      expect(@platoVega.lipsPorcent).to eq(40.397)
      expect(@platoVega.protsPorcent).to eq(17.517)
      @platoVegaN.insert_alimH(@chocolate, 80)
      @platoVegaN.insert_alimH(@nuez, 70)
      @platoVegaN.insert_alimH(@lentejas, 190)
    end

    it "Creando plato de dieta Carnivora" do
      
      @platoCar.insert_alimH(@cerdo, 110)
      @platoCar.insert_alimH(@carneVaca, 110)
      @platoCar.insert_alimH(@chocolate, 100)
      @platoCar.insert_alimH(@lentejas, 90)
      expect(@platoCar.carbsPorcent).to eq(35.979)
      expect(@platoCar.lipsPorcent).to eq(35.902)
      expect(@platoCar.protsPorcent).to eq(28.119)
      @platoCarN.insert_alimH(@cerdo, 110)
      @platoCarN.insert_alimH(@carneVaca, 110)
      @platoCarN.insert_alimH(@chocolate, 100)
      @platoCarN.insert_alimH(@lentejas, 90)
    end
  end
  context "Comparando informacion nutricional de platos" do

    it "Comparando el plato de dieta Española" do
      expect(@platoEspN<@platoVasN).to eq(false)
      expect(@platoEspN>@platoVasN).to eq(true)
      expect(@platoEspN==@platoVasN).to eq(false)
      expect(@platoEspN>=@platoVasN).to eq(true)
      expect(@platoEspN<=@platoVasN).to eq(false)
      expect(@platoEspN.between?(@platoVegN, @platoVasN)).to eq(false)
      expect(@platoEspN.clamp(@platoVasN, @platoVegN)).to eq(@platoVegN)
      expect(@platoEspN<@platoVegN).to eq(false)
      expect(@platoEspN>@platoVegN).to eq(true)
      expect(@platoEspN==@platoVegN).to eq(false)
      expect(@platoEspN>=@platoVegN).to eq(true)
      expect(@platoEspN<=@platoVegN).to eq(false)
      expect(@platoEspN<@platoVegaN).to eq(false)
      expect(@platoEspN>@platoVegaN).to eq(true)
      expect(@platoEspN==@platoVegaN).to eq(false)
      expect(@platoEspN>=@platoVegaN).to eq(true)
      expect(@platoEspN<=@platoVegaN).to eq(false)
      expect(@platoEspN<@platoCarN).to eq(false)
      expect(@platoEspN>@platoCarN).to eq(true)
      expect(@platoEspN==@platoCarN).to eq(false)
      expect(@platoEspN>=@platoCarN).to eq(true)
      expect(@platoEspN<=@platoCarN).to eq(false)
    end

    it "Compatando el plato de dieta Vasca" do
      expect(@platoVasN<@platoVegN).to eq(true)
      expect(@platoVasN>@platoVegN).to eq(false)
      expect(@platoVasN==@platoVegN).to eq(false)
      expect(@platoVasN>=@platoVegN).to eq(false)
      expect(@platoVasN<=@platoVegN).to eq(true)
      expect(@platoVasN<@platoVegaN).to eq(true)
      expect(@platoVasN>@platoVegaN).to eq(false)
      expect(@platoVasN==@platoVegaN).to eq(false)
      expect(@platoVasN>=@platoVegaN).to eq(false)
      expect(@platoVasN<=@platoVegaN).to eq(true)
      expect(@platoVasN<@platoCarN).to eq(false)
      expect(@platoVasN>@platoCarN).to eq(true)
      expect(@platoVasN==@platoCarN).to eq(false)
      expect(@platoVasN>=@platoCarN).to eq(true)
      expect(@platoVasN<=@platoCarN).to eq(false)
    end

    it "Comparando el plato de dieta Vegetariana" do
      expect(@platoVegN<@platoVegaN).to eq(true)
      expect(@platoVegN>@platoVegaN).to eq(false)
      expect(@platoVegN==@platoVegaN).to eq(false)
      expect(@platoVegN>=@platoVegaN).to eq(false)
      expect(@platoVegN<=@platoVegaN).to eq(true)
      expect(@platoVegN<@platoCarN).to eq(false)
      expect(@platoVegN>@platoCarN).to eq(true)
      expect(@platoVegN==@platoCarN).to eq(false)
      expect(@platoVegN>=@platoCarN).to eq(true)
      expect(@platoVegN<=@platoCarN).to eq(false)
    end

    it "Finalizando comparaciones de platos" do
      expect(@platoVegaN<@platoCarN).to eq(false)
      expect(@platoVegaN>@platoCarN).to eq(true)
      expect(@platoVegaN==@platoCarN).to eq(false)
      expect(@platoVegaN>=@platoCarN).to eq(true)
      expect(@platoVegaN<=@platoCarN).to eq(false)
    end
  end
  context "Comparando informacion Ambiental de platos" do

    it "Comparando el plato de dieta Española" do
      expect(@platoEsp<@platoVas).to eq(false)
      expect(@platoEsp>@platoVas).to eq(true)
      expect(@platoEsp==@platoVas).to eq(false)
      expect(@platoEsp>=@platoVas).to eq(true)
      expect(@platoEsp<=@platoVas).to eq(false)
      expect(@platoEsp.between?(@platoVeg, @platoVas)).to eq(false)
      expect(@platoEsp.clamp(@platoVas, @platoVeg)).to eq(@platoVeg)
      expect(@platoEsp<@platoVeg).to eq(false)
      expect(@platoEsp>@platoVeg).to eq(true)
      expect(@platoEsp==@platoVeg).to eq(false)
      expect(@platoEsp>=@platoVeg).to eq(true)
      expect(@platoEsp<=@platoVeg).to eq(false)
      expect(@platoEsp<@platoVega).to eq(false)
      expect(@platoEsp>@platoVega).to eq(true)
      expect(@platoEsp==@platoVega).to eq(false)
      expect(@platoEsp>=@platoVega).to eq(true)
      expect(@platoEsp<=@platoVega).to eq(false)
      expect(@platoEsp<@platoCar).to eq(true)
      expect(@platoEsp>@platoCar).to eq(false)
      expect(@platoEsp==@platoCar).to eq(false)
      expect(@platoEsp>=@platoCar).to eq(false)
      expect(@platoEsp<=@platoCar).to eq(true)
    end

    it "Compatando el plato de dieta Vasca" do
      expect(@platoVas<@platoVeg).to eq(true)
      expect(@platoVas>@platoVeg).to eq(false)
      expect(@platoVas==@platoVeg).to eq(false)
      expect(@platoVas>=@platoVeg).to eq(false)
      expect(@platoVas<=@platoVeg).to eq(true)
      expect(@platoVas<@platoVega).to eq(true)
      expect(@platoVas>@platoVega).to eq(false)
      expect(@platoVas==@platoVega).to eq(false)
      expect(@platoVas>=@platoVega).to eq(false)
      expect(@platoVas<=@platoVega).to eq(true)
      expect(@platoVas<@platoCar).to eq(true)
      expect(@platoVas>@platoCar).to eq(false)
      expect(@platoVas==@platoCar).to eq(false)
      expect(@platoVas>=@platoCar).to eq(false)
      expect(@platoVas<=@platoCar).to eq(true)
    end

    it "Comparando el plato de dieta Vegetariana" do
      expect(@platoVeg<@platoVega).to eq(false)
      expect(@platoVeg>@platoVega).to eq(true)
      expect(@platoVeg==@platoVega).to eq(false)
      expect(@platoVeg>=@platoVega).to eq(true)
      expect(@platoVeg<=@platoVega).to eq(false)
      expect(@platoVeg<@platoCar).to eq(true)
      expect(@platoVeg>@platoCar).to eq(false)
      expect(@platoVeg==@platoCar).to eq(false)
      expect(@platoVeg>=@platoCar).to eq(false)
      expect(@platoVeg<=@platoCar).to eq(true)
    end

    it "Finalizando comparaciones de platos" do
      expect(@platoVega<@platoCar).to eq(true)
      expect(@platoVega>@platoCar).to eq(false)
      expect(@platoVega==@platoCar).to eq(false)
      expect(@platoVega>=@platoCar).to eq(false)
      expect(@platoVega<=@platoCar).to eq(true)
    end

  end

  context "Enumerando listas de platos de la misma dieta" do

    it "Creando las listas de platos" do
      @platoEspN2.insert_alimH(@lentejas, 180)
      @platoEspN2.insert_alimH(@chocolate, 80)
      @platoEspN2.insert_alimH(@cerdo, 80)
      @platoEspN2.insert_alimH(@nuez, 30)
      @platoEspN3.insert_alimH(@lentejas, 220)
      @platoEspN3.insert_alimH(@chocolate, 90)
      @platoEspN3.insert_alimH(@cerdo, 90)
      @platoEspN3.insert_alimH(@nuez, 70)
      @platoVasN2.insert_alimH(@lentejas, 220)
      @platoVasN2.insert_alimH(@chocolate, 110)
      @platoVasN2.insert_alimH(@cerveza, 230)
      @platoVasN3.insert_alimH(@lentejas, 300)
      @platoVasN3.insert_alimH(@chocolate, 150)
      @platoVasN3.insert_alimH(@cerveza, 400)
      @platoVegN2.insert_alimH(@huevos, 40)
      @platoVegN2.insert_alimH(@leche, 40)
      @platoVegN2.insert_alimH(@chocolate, 80)
      @platoVegN2.insert_alimH(@nuez, 50)
      @platoVegN2.insert_alimH(@lentejas, 130)
      @platoVegN3.insert_alimH(@huevos, 20)
      @platoVegN3.insert_alimH(@leche, 20)
      @platoVegN3.insert_alimH(@chocolate, 60)
      @platoVegN3.insert_alimH(@nuez, 90)
      @platoVegN3.insert_alimH(@lentejas, 200)
      @platoVegaN2.insert_alimH(@chocolate, 70)
      @platoVegaN2.insert_alimH(@nuez, 60)
      @platoVegaN2.insert_alimH(@lentejas, 160)
      @platoVegaN3.insert_alimH(@chocolate, 90)
      @platoVegaN3.insert_alimH(@nuez, 90)
      @platoVegaN3.insert_alimH(@lentejas, 240)
      @platoCarN2.insert_alimH(@cerdo, 130)
      @platoCarN2.insert_alimH(@carneVaca, 120)
      @platoCarN2.insert_alimH(@chocolate, 110)
      @platoCarN2.insert_alimH(@lentejas, 120)
      @platoCarN3.insert_alimH(@cerdo, 100)
      @platoCarN3.insert_alimH(@carneVaca, 100)
      @platoCarN3.insert_alimH(@chocolate, 110)
      @platoCarN3.insert_alimH(@lentejas, 80)

      @listaEsp.insert_head(@platoEspN)
      @listaEsp.insert_head(@platoEspN2)
      @listaEsp.insert_head(@platoEspN3)
      expect(@listaEsp.head.value).to eq(@platoEspN3)

      @listaVas.insert_head(@platoVasN)
      @listaVas.insert_head(@platoVasN2)
      @listaVas.insert_head(@platoVasN3)
      expect(@listaVas.head.value).to eq(@platoVasN3)

      @listaVeg.insert_head(@platoVegN)
      @listaVeg.insert_head(@platoVegN2)
      @listaVeg.insert_head(@platoVegN3)
      expect(@listaVeg.head.value).to eq(@platoVegN3)

      @listaVega.insert_head(@platoVegaN)
      @listaVega.insert_head(@platoVegaN2)
      @listaVega.insert_head(@platoVegaN3)
      expect(@listaVega.head.value).to eq(@platoVegaN3)

      @listaCar.insert_head(@platoCarN)
      @listaCar.insert_head(@platoCarN2)
      @listaCar.insert_head(@platoCarN3)
      expect(@listaCar.head.value).to eq(@platoCarN3)
      
    end

    it "Metodo collect" do
      expect(@listaEsp.collect { "cat"}).to eq(["cat", "cat", "cat"])
      expect(@listaVas.collect { "cat"}).to eq(["cat", "cat", "cat"])
      expect(@listaVeg.collect { "cat"}).to eq(["cat", "cat", "cat"])
      expect(@listaVega.collect { "cat"}).to eq(["cat", "cat", "cat"])
      expect(@listaCar.collect { "cat"}).to eq(["cat", "cat", "cat"])
    end
    
    it "Metodo select" do
      expect(@listaEsp.select { |i| i.vct < 1500}).to eq([@platoEspN2, @platoEspN])
      expect(@listaVas.select { |i| i.vct < 1500}).to eq([@platoVasN2, @platoVasN])
      expect(@listaVeg.select { |i| i.vct < 1500}).to eq([@platoVegN2, @platoVegN])
      expect(@listaVega.select { |i| i.vct < 1500}).to eq([@platoVegaN2, @platoVegaN])
      expect(@listaCar.select { |i| i.vct < 1500}).to eq([@platoCarN3, @platoCarN2, @platoCarN])
    end
    
    

  end

end

end