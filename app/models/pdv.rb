#encoding: utf-8

class Pdv < ActiveRecord::Base
  belongs_to :municipio, foreign_key: :id_municipio
  belongs_to :cadena, foreign_key: :id_cadena
  has_one :captura
  has_one :fase, through: :captura
  validates :precision, inclusion: { in: ["exacta","aproximada"]}
  PRECISION = ["exacta","aproximada"]

  scope :asignar, lambda {|numero| joins(:captura).where(latitude: nil).where(longitude: nil).order(municipio: :estado).first(numero)}
  scope :asignadas, lambda {|user, pagina| joins(:fase).where("fases.user_id = ?", user.id ).where(latitude: nil).where(longitude: nil).page(pagina) }


  attr_accessible :calle, :ciudad, :colonia, :cp, :curt, :id, :latitude, :longitude, :no_exterior, :no_interior, :nombre, :precision, :ref_1, :ref_2, :status, :status_reg, :telefono_1, :telefono_2, :estado, :is_admin


  geocoded_by :geocodificacion, latitude:  :latitude, longitude: :longitude
  after_create :asegurar
  acts_as_gmappable lat: :latitude, lng: :longitude, address:  :geocodificacion,  process_geocoding: false



  def geocodificacion
    "#{calle.downcase} #{no_exterior.downcase}, #{colonia.downcase}, C.P. #{cp}, #{municipio.nombre.downcase}, #{municipio.estado_nombre.downcase.camelcase},  México"
  end

  def geocod
    asegurar if (self.latitude ==0 && self.longitude == 0) || !(latitude? && longitude?)
  end

  def asegurar!
    geocode
    self.save
  end
  def asegurar
    geocode unless (self.latitude? && self.longitude?)

  end

  def estado
    self.municipio.estado_nombre

  end

  def asignar_captura (fase)
    # unless self.captura
    self.captura ||= Captura.create()
    self.captura.pdv_id = self.id
    self.captura.fase_id = fase.id
    self.captura.fase = fase.nombre
    self.captura.save
    # end
  end

  def captura?
    true if self.captura || false
  end

  def commit
    self.latitude, self.longitude = self.captura.latitude, self.captura.longitude
  end

end
