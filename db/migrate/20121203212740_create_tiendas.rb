class CreateTiendas < ActiveRecord::Migration
  def change
    create_table :tiendas do |t|
      t.integer :curt
      t.text :cadena
      t.text :formato
      t.string :tienda
      t.integer :determinante
      t.string :imagen
      t.text :canal
      t.text :municipio
      t.string :estado
      t.text :direccion
      t.integer :codigo_postal
      t.string :area
      t.string :region
      t.string :status_tienda
      t.string :status_registro
      t.string :precision
      t.float :latitud
      t.float :longitud
      t.string :serpel
      t.string :miguel
      t.text :comentario
      t.string :fases
      t.string :responsable
      t.timestamp :fecha
      t.string :alcance_diageo

      t.timestamps
    end
  end
end
