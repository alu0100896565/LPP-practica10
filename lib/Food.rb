require "Food/version"

module Food
  class Error < StandardError; end
  class Alimentos

    attr_reader :nombre, :emisiones, :terreno, :prot, :carbs, :lip
    def initialize(datos)

      @nombre = datos[:nombre]
      @emisiones = datos[:emisiones]
      @terreno = datos[:terreno]
      @prot = datos[:prot]
      @carbs = datos[:carbs]
      @lip = datos[:lip]

    end

    def to_s

      "#{@nombre}: { prot: #{@prot}, carbs: #{@carbs}, lip: #{@lip}, emisiones: #{@emisiones}, terreno: #{@terreno} }"
    end

    def valorEnergetico
      ((@prot*4.0)+(@carbs*4.0)+(@lip*9.0)).round(3)
    end

    def +(other)
      suma = { :nombre => "Mezcla", :emisiones => (self.emisiones+other.emisiones).round(3), :terreno => (self.terreno+other.terreno).round(3), :prot => (self.prot+other.prot).round(3), :carbs => (self.carbs+other.carbs).round(3), :lip => (self.lip+other.lip).round(3)}
      Alimentos.new(suma)
    end
  end

  class Dieta

    attr_reader :nombre, :genero, :alimentos, :alimentoTotal
    def initialize(nombre, genero, alimentos)
      @nombre = nombre
      @genero = genero
      if alimentos.instance_of? Array
      @alimentos = alimentos
      end
      @alimentoTotal = Alimentos.new({ :nombre => nombre, :prot => 0.0, :carbs => 0.0, :lip => 0.0, :emisiones => 0.0, :terreno => 0.0})
    end

    def sumaAlimentos

      @alimentos.each { |x| @alimentoTotal=@alimentoTotal+x}

    end

    def idr

      if @genero = "hombre" && @alimentoTotal.prot >= 54.0 && @alimentoTotal.valorEnergetico >= 3000
        return true
      elseif @genero = "mujer" && @alimentoTotal.prot >= 41.0 && @alimentoTotal.valorEnergetico >= 2300
        return true
      else return false

      end
    end

    def impactoAmbiental

      "Para la dieta #{@nombre} las emisiones de gases kgCO2eq son: #{@alimentoTotal.emisiones} y el terreno usado en m2 por año es: #{@alimentoTotal.terreno}"

    end
    
  end

  Node = Struct.new(:value, :next, :prev) do 


  end

  class List
    attr_reader :head, :tail
    def initialize()
      @head = nil
      @tail = nil
    end

    def empty
      if @head == nil && @tail == nil
        return true
      else
        return false
      end
    end
    
    def insert_head(nodo)
      raise TypeError, "Se espera como argumento un nodo: Node" unless nodo.is_a?Node
      if self.empty
        @head = nodo
        @tail = nodo
      else 
        @head.prev = nodo
        nodo.next = @head
        @head = nodo
      end
    end
    
    def insert_tail(nodo)
      raise TypeError, "Se espera como argumento un nodo: Node" unless nodo.is_a?Node
      if self.empty
        @head = nodo
        @tail = nodo
      else 
        @tail.next = nodo
        nodo.prev = @tail
        @tail = nodo
      end
    end

    def insert_various_head(arrayNodos)
      raise TypeError, "Se espera como argumento un array" unless arrayNodos.is_a?Array
      for i in arrayNodos do
        self.insert_head(i)
      end
    end
    
    def insert_various_tail(arrayNodos)
      raise TypeError, "Se espera como argumento un array" unless arrayNodos.is_a?Array
      for i in arrayNodos do
        self.insert_tail(i)
      end
    end

    def extract_head()

      if self.empty
        puts "La lista esta vacia"
        return nil
      end
      nodo = @head
      @head = @head.next
      if @head != nil
        @head.prev = nil;
      else @tail = nil
      end
      nodo.prev = nil
      nodo.next = nil
      return nodo
    end

    def extract_tail()

      if self.empty
        puts "La lista esta vacia"
        return nil
      end
      nodo = @tail
      @tail = @tail.prev
      if @tail != nil
        @tail.next = nil;
      else @head = nil
      end
      nodo.prev = nil
      nodo.next = nil
      return nodo
    end

end

end
