class Municipio < ActiveRecord::Base
  has_many :pdv, foreign_key: "id_municipio"
  belongs_to :estado, foreign_key: :id_estado
  attr_accessible :nombre
  delegate :nombre,  to: :estado, prefix: "estado"

  def to_s
  	nombre
  end
  
end