class Fase < ActiveRecord::Base
  has_many :capturas, foreign_key: "id_fase"
  has_many :pdvs, through: :captura
  has_one :user


  attr_accessible :comentario, :costo, :encontradas, :fase, :fecha, :minutos_consumidos, :responsable, :tiempo_invertido

  def asignar
  	Pdv.asignar.each do |pdv|
  		pdv.asignar_captura 
  	end

  end

end
