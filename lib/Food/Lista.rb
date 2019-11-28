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

      def each(&block)
        return nil if @head == nil
        nodo = @head
        while true
        block.call(nodo.value)
        #yield nodo.value
        if nodo.next == nil
          break
        end
        nodo = nodo.next
        
        end
      end
  
      def empty
        if @head == nil && @tail == nil
          return true
        else
          return false
        end
      end
      
      def insert_head(val)
          nodo = Node.new(val,nil,nil)
        if self.empty
          @head = nodo
          @tail = nodo
        else 
          @head.prev = nodo
          nodo.next = @head
          @head = nodo
        end
      end
      
      def insert_tail(val)
        nodo = Node.new(val,nil,nil)
        if self.empty
          @head = nodo
          @tail = nodo
        else 
          @tail.next = nodo
          nodo.prev = @tail
          @tail = nodo
        end
      end
  
      def insert_various_head(array)
        raise TypeError, "Se espera como argumento un array" unless array.is_a?Array
        for i in array do
          self.insert_head(i)
        end
      end
      
      def insert_various_tail(array)
        raise TypeError, "Se espera como argumento un array" unless array.is_a?Array
        for i in array do
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
        return nodo.value
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
        return nodo.value
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