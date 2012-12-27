#encoding: utf-8

class Pdv < ActiveRecord::Base
  belongs_to :municipio, foreign_key: :id_municipio
  belongs_to :cadena, foreign_key: :id_cadena
  has_one :captura
  has_one :fase, through: :captura
  validates :precision, inclusion: { in: ["exacta","aproximada"]}

  scope :asignar, joins(:captura,:municipio,municipio: :estado).where(latitude: nil).where(longitude: nil).order(municipio: :estado)
  scope :asignadas, joins(:fase)#.where("fase.user_id = ?",current_user.id)


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
  def estado
    self.municipio.estado_nombre

  end
  
  def asignar_captura 
    unless self.captura
      c = Captura.create()
      c.pdv_id = self.id
      c.save
    end
  end

  def captura?
    true if self.captura || false
  end

end
