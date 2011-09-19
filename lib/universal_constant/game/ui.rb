module UniversalConstant
  class Game
    module UI
      @@output_stream = $stdout

      def self.say(stuff)
        output_stream.puts(stuff.to_s)
      end

      private

      def self.output_stream
        @@output_stream
      end
    end
  end
end
