module UniversalConstant
  class Game
    module UI
      @output_stream = $stdout

      def say(stuff)
        output_stream.puts(stuff.to_s)
      end

      def list(*items)
        items.each_with_index do |item, index|
          say("#{index + 1}. #{item.to_s}")
        end
      end

      def ask(message = nil)
        say(message) if message
        output_stream.print('> ')
        gets
      end

      private

      def output_stream
        @output_stream
      end
    end
  end
end
