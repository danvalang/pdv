class Estado < ActiveRecord::Base
	has_many :municipios, foreign_key: "id_estado"
	has_many :pdvs, through: :municipios, foreign_key: "id_estado"
	
  attr_accessible :abreviacion, :nombre
    alias_attribute  :nombre_estado, :nombre

end
