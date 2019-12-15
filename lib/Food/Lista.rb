# encoding: utf-8
# Este módulo se ha creado para describir
# el comportamiento tanto de alimentos
# como de platos formados por ellos mediante
# listas de los mismos, centrandose en su
# informacion nutricional y su huella ambiental.
#
# Author::    Eduardo Suarez Ojeda  (mailto:alu0100896565@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby
module Food

    # Estructura Nodo para rellenar las listas enlazadas
    Node = Struct.new(:value, :next, :prev) do 
    end
  
    # Clase de listas enlazadas.
    # Incluye el mixin Enumerable.
    class List
      include Enumerable
      attr_reader :head, :tail
      # Inicializacion estandar de la lista.
      def initialize()
        @head = nil
        @tail = nil
      end

      # Defino each para poder usar el modulo Enumerable.
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
  
      # Comprueba si la lista esta vacia.
      def empty
        if @head == nil && @tail == nil
          return true
        else
          return false
        end
      end
      
      # Inserta por la cabeza un objeto.
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
      
      # Inserta por la cola un objeto.
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
  
      # Inserta por la cabeza varios objetos.
      def insert_various_head(array)
        raise TypeError, "Se espera como argumento un array" unless array.is_a?Array
        for i in array do
          self.insert_head(i)
        end
      end
      
      # Inserta por la cola varios objetos.
      def insert_various_tail(array)
        raise TypeError, "Se espera como argumento un array" unless array.is_a?Array
        for i in array do
          self.insert_tail(i)
        end
      end
  
      # Extrae el objeto que se encuentra en la cabeza.
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
  
      # Extrae el objeto que se encuentra en la cola.
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
  
      # Recorre la lista y devuelve el contenido formateado.
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