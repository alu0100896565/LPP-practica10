module Food

    class Plato_menu < Platos_Ambiental

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
        
              arrayAlimentos.find { |x| nombre == x.nombre}
            end

        def initialize (nombre)
            super(nombre)
        end

        def alimento(nombreAlim, gram)
            alim = Plato_menu.__alimento(nombreAlim)
            insert_alimH(alim, gram)
        end

    end

end