#encoding: utf-8

class Pdv < ActiveRecord::Base
  belongs_to :municipio, foreign_key: :id_municipio
  belongs_to :cadena, foreign_key: :id_cadena
  has_one :captura
  has_one :fase, through: :captura

  attr_accessible :calle, :ciudad, :colonia, :cp, :curt, :id, :latitude, :longitude, :no_exterior, :no_interior, :nombre, :precision, :ref_1, :ref_2, :status, :status_reg, :telefono_1, :telefono_2, :estado, :is_admin

  validates :precision, inclusion: { in: ["exacta","aproximada"]}
  validates :status_reg, inclusion: { in: ["LIBERADO", "NO REVISADO", "CLAUSURADO"]}

  PRECISION = ["exacta","aproximada"]
  STATUSR = ["LIBERADO", "NO REVISADO", "CLAUSURADO"]
  after_create :asegurar

  scope :asignar, lambda {|numero| joins(:captura).where(latitude: nil).where(longitude: nil).order(municipio: :estado).first(numero)}
  scope :asignadas, lambda {|user, pagina| joins(:fase).where("fases.user_id = ?", user.id ).where(latitude: nil).where(longitude: nil).page(pagina) }
    
  acts_as_gmappable lat: :latitude, lng: :longitude, address:  :geocodificacion,  process_geocoding: false
  geocoded_by :geocodificacion, latitude:  :latitude, longitude: :longitude


  def geocodificacion
    "#{calle.downcase} #{no_exterior.downcase}, #{colonia.downcase}, C.P. #{cp}, #{municipio.nombre.downcase}, #{municipio.estado_nombre.downcase.camelcase},  México"
  end

  def geocod
    asegurar if (self.latitude ==0 && self.longitude == 0) || !(latitude? && longitude?)
  end

  def asegurar!
    asegurar self
    self.save
  end
  def asegurar
    self.latitude ||= self.captura.latitude
    self.longitude ||= self.captura.longitude
    geocode unless (self.latitude? && self.longitude?)

  end

  def estado
    self.municipio.estado_nombre

  end

  def asignar_captura (fase)
    # unless self.captura
    self.captura ||= Captura.create()
    # self.captura.pdv_id = self.id
    # self.captura.fase_id = fase.id
    self.captura.fase = fase
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
