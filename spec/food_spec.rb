require 'food'
RSpec.describe Alimentos do
  before (:all) do
    @lentejasDat = { :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4}
    @lentejas = Alimentos.new(@lentejasDat)
    @comidita = [@lentejas, @lentejas]
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

  @dietita.sumaAlimentos

  expect(@dietita.alimentoTotal.prot).to eq(47.0)
  expect(@dietita.alimentoTotal.carbs).to eq(104.0)
  expect(@dietita.alimentoTotal.lip).to eq(2.8)
  expect(@dietita.alimentoTotal.emisiones).to eq(0.8)
  expect(@dietita.alimentoTotal.terreno).to eq(6.8)
end

it "Comprobar si la Alimentacion de la dieta cumple con el IDR para el género" do
  @dietita.sumaAlimentos

  expect(@dietita.idr).to eq(true)
end

end
end