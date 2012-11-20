require 'kinetosis/version'
require 'kinetosis/kinetosis'

module Kinetosis
  def x
    xyz[0]
  end

  def y
    xyz[1]
  end

  def z
    xyz[2]
  end

  def has_sudden_motion_sensor?
    xyz != "Error"
  end
end
