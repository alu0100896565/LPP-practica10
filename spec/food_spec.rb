require 'food'
RSpec.describe Alimentos do
  before (:all) do
    @lentejasDat = { :nombre => "lentejas", :prot => 23.5, :carbs => 52.0, :lip => 1.4, :emisiones => 0.4, :terreno => 3.4}
    @lentejas = Alimentos.new(@lentejasDat)
    @dietita = Dieta.new("Dietita")
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

end
end