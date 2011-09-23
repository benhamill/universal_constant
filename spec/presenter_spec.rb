require 'spec_helper'

describe UniversalConstant::Presenter do
  describe "#format_output" do
    it "wraps long lines at word-breaks at or before 80 characters" do
#                                                                  80 chars -> |
long_string = <<-STR
This is a really long sentence that's so long, it just goes ON and ON and ON and no one knows when it will end, but, *whew* it eventually does. See, I bet you thought it wouldn't end. Didn't you? But it did. And now there's lots of shorter sentences. Not all of them are super short. But some are.
STR
      subject.format_output(long_string).should == <<-STR
This is a really long sentence that's so long, it just goes ON and ON and ON and
no one knows when it will end, but, *whew* it eventually does. See, I bet you
thought it wouldn't end. Didn't you? But it did. And now there's lots of shorter
sentences. Not all of them are super short. But some are.
STR
    end

    it "preserves carriage returns within the argument" do
      output = "Some Kind of Title\nThis is what I think about all of that.\n\nOther things.\n"
      subject.format_output(output).should == output
    end
  end
end
