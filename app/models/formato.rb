class Formato < ActiveRecord::Base
	has_many :cadenas
  attr_accessible :nombre
end
