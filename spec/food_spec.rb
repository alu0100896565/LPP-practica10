require 'food'
RSpec.describe Alimentos do
  before (:all) do
    @lentejas = Alimentos.new
  end

  context "Probando que exista la clase Alimentos" do
    it "Se ha de poder instanciar un alimento" do
      expect(@lentejas.instance_of? Alimentos).to eq(true)
    end
end

end
