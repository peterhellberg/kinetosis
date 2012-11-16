require 'kinetosis'
require 'rspec'
require 'rspec/autorun'

describe Kinetosis do
  before do
    @mbp = Object.new.extend(Kinetosis)
  end

  describe "when asked for xyz" do
    it "should respond with an array consisting of three fixnums" do
      @mbp.xyz.should have(3).items
      @mbp.xyz.map(&:class).uniq.should == [Fixnum]
    end
  end

  describe "when asked about x and y individually" do
    it "should respond with integers" do
      (-255..255).should include(@mbp.x)
      (-255..255).should include(@mbp.y)
    end
  end

  describe "when the laptop is standing on a table" do
    it "should respond with an x <= 20 and y <= 0" do
      (0..20).should include(@mbp.x)
      (-40..0).should include(@mbp.y)
    end
  end
end
