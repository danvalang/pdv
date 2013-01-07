class Cadena < ActiveRecord::Base
  belongs_to :actividad, foreign_key: "id_actividad"
  belongs_to :canale, foreign_key: "id_canal"
  belongs_to :formato, foreign_key: "id_formato"
  has_many :pdvs
  attr_accessible :nombre, :pagina_web

  def to_s
    nombre
  end
end
