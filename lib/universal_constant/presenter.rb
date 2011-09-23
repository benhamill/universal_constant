module UniversalConstant
  class Presenter
    def format_output(output)
      output.lines.inject("") do |memo, line|
        memo << "#{wrap(line)}\n"
      end
    end

    def message
      format_output(@message)
    end

    private

    def wrap(line)
      current_line_length = 0

      line.split(' ').inject("") do |memo, word|
        current_line_length += word.length + 1

        if current_line_length > 81
          current_line_length = 1 + word.length
          memo.gsub(/ +$/, '') << "\n#{word} "
        else
          memo << "#{word} "
        end
      end.gsub(/ +$/, '')
    end
  end
end
