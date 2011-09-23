module UniversalConstant
  class Game
    module UI
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
        gets.chomp
      end

      private

      def output_stream
        @output_stream ||= $stdout
      end
    end
  end
end
