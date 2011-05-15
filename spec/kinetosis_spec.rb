require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'

require File.dirname(__FILE__) + '/../lib/kinetosis'

describe Kinetosis do
  before do
    @mbp = Object.new.extend(Kinetosis)
  end

  describe "when asked for xyz" do
    it "should respond with an array consisting of three fixnums" do
      @mbp.xyz.size.must_equal 3
      @mbp.xyz.map { |v| v.class.must_equal Fixnum }
    end
  end

  describe "when asked about x and y individually" do
    it "should respond with integers" do
      (-255..255).must_include @mbp.x
      (-255..255).must_include @mbp.y
    end
  end

  describe "when the laptop is standing on a table" do
    it "should respond with an x = <5 and y = <0" do
      (0..5).must_include @mbp.x
      (-5..0).must_include @mbp.y
    end
  end
end
