#encoding: utf-8

class Pdv < ActiveRecord::Base
  belongs_to :municipio, foreign_key: :id_municipio
  belongs_to :cadena, foreign_key: :id_cadena
  has_one :captura, foreign_key: :curt
  has_one :fase, through: :captura


  scope :poco, where("latitude is null").limit(5)

  attr_accessible :calle, :ciudad, :colonia, :cp, :curt, :id, :latitude, :longitude, :no_exterior, :no_interior, :nombre, :precision, :ref_1, :ref_2, :status, :status_reg, :telefono_1, :telefono_2, :estado, :is_admin
    # attr_protected :is_admin
  attr_accessor :is_admin

  geocoded_by :geocodificacion, latitude:  :latitude, longitude: :longitude
  after_create :asegurar
  acts_as_gmappable lat: :latitude, lng: :longitude, address:  :geocodificacion,  process_geocoding: false
  validates :precision, :inclusion => { :in => ["exacta","aproximada"]}
  # before_save {self.status_reg = "LIBERADO"}


  def geocodificacion
    "#{calle.downcase} #{no_exterior.downcase}, #{colonia.downcase}, C.P. #{cp}, #{municipio.nombre.downcase}, #{municipio.estado_nombre.downcase.camelcase},  México"
  end

  def asegurar
    geocode if (self.latitude ==0 && self.longitude == 0) || !(latitude? && longitude?)
  end

  def asegurar!
    geocode
    self.save
  end
end
