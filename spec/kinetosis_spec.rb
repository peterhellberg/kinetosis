require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'

require File.dirname(__FILE__) + '/../lib/kinetosis'

describe Kinetosis do
  before do
    @object = Object.new
    @object.extend(Kinetosis)
  end

  describe "when asked for xyz" do
    it "should respond with an array with three values" do
      @object.xyz.size.must_equal 3
    end
  end

  describe "when asked about x" do
    it "should respond with an integer" do
      @object.x.class
    end
  end

  describe "when the laptop is standing on a table" do
    it "should respond with an x = <5 and y = <0" do
      (0..5).must_include @object.x
      (-5..0).must_include @object.y
    end
  end
end
