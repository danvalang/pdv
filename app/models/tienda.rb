#encoding: utf-8

class Tienda < ActiveRecord::Base
  attr_accessible :alcance_diageo, :area, :cadena, :canal, :codigo_postal, :comentario, :curt, :determinante, :direccion, :estado, :fases, :fecha, :formato, :imagen, :latitud, :longitud, :miguel, :municipio, :precision, :region, :responsable, :serpel, :status_registro, :status_tienda, :tienda
  scope :desactualizada, where("responsable = ''")
  geocoded_by :geocodificacion, latitude:  :latitud, longitude: :longitud
  # before_update :geocode
  acts_as_gmappable lat: :latitud, lng: :longitud, address:  :geocodificacion,  process_geocoding: false

  PRECISION = ["exacta","aproximada"]

  def geocodificacion

    "#{direccion}, #{municipio}, #{estado}, México, #{codigo_postal}"

  end

  def asegurar
    geocode if (self.latitud ==0 && self.longitud == 0) || !(latitud? && longitud?)
  end


end
