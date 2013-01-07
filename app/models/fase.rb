class Fase < ActiveRecord::Base
  has_many :capturas, foreign_key: "fase_id"
  has_many :pdvs, through: :capturas
  belongs_to :user
  before_save :users


  attr_accessible :comentario, :costo, :encontradas, :nombre, :fecha, :minutos_consumidos, :responsable, :tiempo_invertido, :user_id

  def asignar 

  	Pdv.asignar(self.encontradas).each do |pdv|
  		pdv.asignar_captura self
  	end
  end

  def users
  	self.user_id = User.where("nombre = ?",self.responsable)
  end


end
