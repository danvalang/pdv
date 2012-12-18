class Captura < ActiveRecord::Base
  # belongs_to :fase, primary_key: :id_fase
  belongs_to :pdv, primary_key: :curt, dependent: :destroy
  # delegate :fase,  to: :fase, prefix: "up"
  attr_accessible :alcance, :comentario, :curt, :fecha, :latitude, :longitude, :usuario
  scope :asignar, where(:captura == nil).joins(municipio: :estado).first(50)

  def to_s
    comentario||"No capturado"
  end
end
