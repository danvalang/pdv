class Cadena < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :canale
  belongs_to :formato
  has_many :pdvs
  attr_accessible :nombre, :pagina_web

  def to_s
    nombre
  end
end
