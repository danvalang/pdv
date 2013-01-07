class Captura < ActiveRecord::Base
  belongs_to :fase
  belongs_to :pdv,  foreign_key: "pdv_id", dependent: :destroy
  delegate :fase,  to: :fase, prefix: "up"
  attr_accessible :alcance, :comentario, :fecha, :latitude, :longitude
  validates_presence_of :pdv_id
  validates_uniqueness_of :pdv_id


  def to_s
    comentario||"No capturado"
  end



end
