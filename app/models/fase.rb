class Fase < ActiveRecord::Base
  has_many :capturas, foreign_key: "id_fase"
  has_many :pdvs, through: :captura
  belongs_to :user
  before_save :users


  attr_accessible :comentario, :costo, :encontradas, :nombre, :fecha, :minutos_consumidos, :responsable, :tiempo_invertido, :user_id

  def asignar 

  	Pdv.asignar(self.encontradas).each do |pdv|
  		pdv.asignar_captura self
  	end
  end

  def users
  	self.user_id = self.responsable.id
  end


end
