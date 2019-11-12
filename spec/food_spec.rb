require 'food'
RSpec.describe Alimentos do
  before (:all) do
    @lentejas = Alimentos.new("lentejas")
  end

  context "Probando que exista la clase Alimentos" do
    it "Se ha de poder instanciar un alimento" do
      expect(@lentejas.instance_of? Alimentos).to eq(true)
    end

    it "Debe existir un nombre para el alimento" do
      expect(@lentejas.nombre).to eq("lentejas")
    end
end

end
