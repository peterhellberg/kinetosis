require 'minitest/pride'
require 'minitest/spec'
require 'minitest/autorun'

require 'kinetosis'

describe Kinetosis do
  before do
    @mbp = Object.new.extend(Kinetosis)
  end

  describe "when asked for xyz" do
    it "should respond with an array consisting of three fixnums" do
      skip unless @mbp.has_sudden_motion_sensor?
      xyz.size.must_equal 3
      xyz.map { |v| v.class.must_equal Fixnum }
    end
  end

  describe "when asked about x and y individually" do
    it "should respond with integers" do
      skip unless @mbp.has_sudden_motion_sensor?
      (-255..255).must_include @mbp.x
      (-255..255).must_include @mbp.y
    end
  end

  describe "when the laptop is standing on a table" do
    it "should respond with an x = <5 and y = <0" do
      skip unless @mbp.has_sudden_motion_sensor?
      (0..5).must_include @mbp.x
      (-5..0).must_include @mbp.y
    end
  end

  describe "x" do
    it "returns the first item in the xyz list" do
      @mbp.stub(:xyz, [1,2,3]) do
        @mbp.x.must_equal 1
      end
    end
  end

  describe "y" do
    it "returns the second item in the xyz list" do
      @mbp.stub(:xyz, [1,2,3]) do
        @mbp.y.must_equal 2
      end
    end
  end

  describe "z" do
    it "returns the third item in the xyz list" do
      @mbp.stub(:xyz, [1,2,3]) do
        @mbp.z.must_equal 3
      end
    end
  end

  describe "has_sudden_motion_sensor?" do
    it "returns false if xyz returns Error" do
      @mbp.stub(:xyz, "Error") do
        @mbp.has_sudden_motion_sensor?.must_equal false
      end
    end

    it "returns true if xyz does not return Error" do
      @mbp.stub(:xyz, [1,2,3]) do
        @mbp.has_sudden_motion_sensor?.must_equal true
      end
    end
  end
end
