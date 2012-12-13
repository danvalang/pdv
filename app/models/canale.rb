class Canale < ActiveRecord::Base
	has_many :cadenas
  attr_accessible :nombre
end
