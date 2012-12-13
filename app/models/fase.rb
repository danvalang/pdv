class Fase < ActiveRecord::Base
  has_many :capturas, foreign_key: "id_fase"
  has_many :pdvs, through: :captura
  scope :con_cadena, joins(:cadena)


  attr_accessible :comentario, :costo, :encontradas, :fase, :fecha, :minutos_consumidos, :responsable, :tiempo_invertido
end
