class Actividad < ActiveRecord::Base
	has_many :cadenas
  attr_accessible :nombre

  def to_s
  	self.nombre
  end
end
