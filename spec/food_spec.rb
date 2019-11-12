require 'food'
RSpec.describe Alimentos do
  before (:all) do
    @lentejasDat = { :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4}
    @carneVacaDat = { :nombre => "Carne de vaca", :prot => 21.1, :carbs => 0.0, :lip => 3.1, :emisiones => 50.0, :terreno => 164.0}
    @carneCorderoDat = { :nombre => "Carne de cordero", :prot => 18.0, :carbs => 0.0, :lip => 17.0, :emisiones => 20.0, :terreno => 185.0}
    @camaronesDat = { :nombre => "Camarones", :prot => 17.6, :carbs => 1.5, :lip => 0.6, :emisiones => 18.0, :terreno => 2.0}
    @chocolateDat = { :nombre => "Chocolate", :prot => 5.3, :carbs => 47.0, :lip => 30.0, :emisiones => 2.3, :terreno => 3.4}
    @salmonDat = { :nombre => "Salmon", :prot => 19.9, :carbs => 0.0, :lip => 13.6, :emisiones => 6.0, :terreno => 3.7}
    @cerdoDat = { :nombre => "Cerdo", :prot => 21.5, :carbs => 0.0, :lip => 6.3, :emisiones => 7.6, :terreno => 11.0}
    @polloDat = { :nombre => "Pollo", :prot => 20.6, :carbs => 0.0, :lip => 5.6, :emisiones => 5.7, :terreno => 7.1}
    @quesoDat = { :nombre => "Queso", :prot => 25.0, :carbs => 1.3, :lip => 33.0, :emisiones => 11.0, :terreno => 41.0}
    @cervezaDat = { :nombre => "Cerveza", :prot => 0.5, :carbs => 3.6, :lip => 0.0, :emisiones => 0.24, :terreno => 0.22}
    @lecheDat = { :nombre => "Leche de vaca", :prot => 3.3, :carbs => 4.8, :lip => 3.2, :emisiones => 3.2, :terreno => 8.9}
    @huevosDat = { :nombre => "Huevos", :prot => 13.0, :carbs => 1.1, :lip => 11.0, :emisiones => 4.2, :terreno => 5.7}
    @cafeDat = { :nombre => "Cafe", :prot => 0.1, :carbs => 0.0, :lip => 0.0, :emisiones => 0.4, :terreno => 0.3}
    @tofuDat = { :nombre => "Tofu", :prot => 8.0, :carbs => 1.9, :lip => 4.8, :emisiones => 2.0, :terreno => 2.2}
    @nuezDat = { :nombre => "Nuez", :prot => 20.0, :carbs => 21.0, :lip => 54.0, :emisiones => 0.3, :terreno => 7.9}
    @lentejas = Alimentos.new(@lentejasDat)
    @carneVaca = Alimentos.new(@carneVacaDat)
    @carneCordero = Alimentos.new(@carneCorderoDat)
    @camarones = Alimentos.new(@camaronesDat)
    @chocolate = Alimentos.new(@chocolateDat)
    @salmon = Alimentos.new(@salmonDat)
    @cerdo = Alimentos.new(@cerdoDat)
    @pollo = Alimentos.new(@polloDat)
    @queso = Alimentos.new(@quesoDat)
    @cerveza = Alimentos.new(@cervezaDat)
    @leche = Alimentos.new(@lecheDat)
    @huevos = Alimentos.new(@huevosDat)
    @cafe = Alimentos.new(@cafeDat)
    @tofu = Alimentos.new(@tofuDat)
    @nuez = Alimentos.new(@nuezDat)
    @comidita = [@lentejas, @pollo, @nuez, @tofu, @queso, @huevos, @salmon, @chocolate, @cafe, @cerveza, @carneVaca, @carneCordero, @salmon, @leche]
    @dietita = Dieta.new("Dietita", "hombre", @comidita)
  end

  context "Probando la clase Alimentos" do
    it "Se ha de poder instanciar un alimento" do
      expect(@lentejas.instance_of? Alimentos).to eq(true)
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

  context "Probando la clase Dieta" do
    it "Se ha de poder instanciar una dieta" do
      expect(@dietita.instance_of? Dieta).to eq(true)
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
  @dietaLentejas = Dieta.new("Dietita", "hombre", @lentejitas)
  
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

end
end