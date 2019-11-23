module Food

    Node = Struct.new(:value, :next, :prev) do 
    end
  
    class List
      include Enumerable
      attr_reader :head, :tail
      def initialize()
        @head = nil
        @tail = nil
      end

      def each()
        
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
  
      def recorrerLista
  
        nodo=@head
        content = ""
        while nodo!=nil do
          content += " " + nodo.value.to_s
          nodo = nodo.next
        end
        return content
      end
  
  end
end