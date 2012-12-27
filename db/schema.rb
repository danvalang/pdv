# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121212073715) do

  create_table "actividads", :force => true do |t|
    t.string "nombre", :limit => 40
  end

  add_index "actividads", ["id"], :name => "id"

  create_table "cadenas", :force => true do |t|
    t.string  "nombre",       :limit => 47
    t.string  "pagina_web",   :limit => 41
    t.integer "id_actividad"
    t.integer "id_canal"
    t.integer "id_formato"
  end

  add_index "cadenas", ["id_actividad"], :name => "id_actividad"
  add_index "cadenas", ["id_canal"], :name => "id_canal"
  add_index "cadenas", ["id_formato"], :name => "id_formato"

  create_table "canales", :force => true do |t|
    t.string "nombre", :limit => 13
  end

  add_index "canales", ["id"], :name => "id"

  create_table "capturas", :force => true do |t|
    t.integer "curt"
    t.string  "latitude",   :limit => 11
    t.string  "longitude",  :limit => 13
    t.text    "comentario"
    t.integer "fase_id"
    t.string  "fase",       :limit => 12
    t.string  "fecha",      :limit => 10
    t.string  "alcance",    :limit => 2
    t.time    "tiempo"
    t.integer "pdv_id"
  end

  add_index "capturas", ["curt"], :name => "curt_3"
  add_index "capturas", ["fase_id"], :name => "fase_id"
  add_index "capturas", ["id"], :name => "curt"
  add_index "capturas", ["id"], :name => "curt_2", :unique => true
  add_index "capturas", ["pdv_id"], :name => "capturas_ibfk_3"

  create_table "estados", :force => true do |t|
    t.string "nombre",      :limit => 31
    t.string "abreviacion", :limit => 6
  end

  add_index "estados", ["id"], :name => "id"

  create_table "fases", :force => true do |t|
    t.date    "fecha"
    t.string  "nombre",             :limit => 12
    t.string  "responsable",        :limit => 8
    t.integer "encontradas"
    t.decimal "tiempo_invertido",                 :precision => 10, :scale => 9
    t.decimal "minutos_consumidos",               :precision => 10, :scale => 9
    t.decimal "costo",                            :precision => 11, :scale => 8
    t.text    "comentario"
    t.integer "user_id"
  end

  add_index "fases", ["nombre"], :name => "fase"
  add_index "fases", ["user_id"], :name => "user_id"

  create_table "formatos", :force => true do |t|
    t.string "nombre", :limit => 23
  end

  add_index "formatos", ["id"], :name => "id"

  create_table "maestro", :id => false, :force => true do |t|
    t.integer "curt"
    t.string  "cadena",          :limit => 18
    t.string  "formato",         :limit => 6
    t.string  "tienda",          :limit => 16
    t.integer "determinante"
    t.string  "imagen",          :limit => 2
    t.string  "canal",           :limit => 13
    t.string  "municipio",       :limit => 14
    t.string  "estado",          :limit => 16
    t.string  "direccion",       :limit => 46
    t.integer "codigo_postal"
    t.string  "area",            :limit => 7
    t.string  "region",          :limit => 6
    t.string  "status_tienda",   :limit => 6
    t.string  "status_registro", :limit => 8
    t.string  "precision",       :limit => 7
    t.decimal "latitud",                       :precision => 8, :scale => 6
    t.decimal "longitud",                      :precision => 9, :scale => 6
    t.string  "serpel",          :limit => 10
    t.string  "miguel",          :limit => 10
    t.string  "comentario",      :limit => 10
    t.string  "fases",           :limit => 6
    t.string  "responsable",     :limit => 7
    t.string  "fecha",           :limit => 9
    t.string  "alcance_diageo",  :limit => 2
  end

  create_table "municipios", :primary_key => "ids", :force => true do |t|
    t.string  "id_inegi",  :limit => 6
    t.string  "nombre",    :limit => 49
    t.integer "id_estado"
  end

  add_index "municipios", ["id_estado"], :name => "id_estado"
  add_index "municipios", ["id_inegi"], :name => "id_inegi"

  create_table "pdv_diageo", :primary_key => "curt", :force => true do |t|
    t.text      "cadena"
    t.text      "formato"
    t.string    "tienda",          :limit => 200
    t.integer   "determinante"
    t.string    "imagen",          :limit => 50
    t.string    "canal",           :limit => 50
    t.text      "municipio"
    t.string    "estado",          :limit => 50
    t.text      "direccion"
    t.integer   "codigo_postal"
    t.string    "area",            :limit => 30
    t.string    "region",          :limit => 10
    t.string    "status_tienda",   :limit => 10
    t.string    "status_registro", :limit => 10
    t.string    "precision",       :limit => 20
    t.float     "latitud",         :limit => 8
    t.float     "longitud",        :limit => 9
    t.string    "serpel",          :limit => 10
    t.string    "miguel",          :limit => 10
    t.text      "comentario"
    t.string    "fases",           :limit => 20
    t.string    "responsable",     :limit => 20
    t.timestamp "fecha"
    t.string    "alcance_diageo",  :limit => 20
  end

  create_table "pdvs", :force => true do |t|
    t.integer "curt"
    t.text    "nombre"
    t.text    "calle"
    t.string  "no_exterior",  :limit => 18
    t.string  "no_interior",  :limit => 15
    t.text    "colonia"
    t.string  "cp",           :limit => 5
    t.text    "ref_1"
    t.text    "ref_2"
    t.string  "latitude",     :limit => 8
    t.string  "longitude",    :limit => 10
    t.string  "precision",    :limit => 11
    t.string  "id_municipio", :limit => 6
    t.integer "id_cadena"
    t.text    "status"
    t.string  "telefono_1",   :limit => 13
    t.string  "telefono_2",   :limit => 13
    t.text    "ciudad"
    t.string  "status_reg",   :limit => 11
  end

  add_index "pdvs", ["curt"], :name => "curt"
  add_index "pdvs", ["id_cadena"], :name => "id_cadena"
  add_index "pdvs", ["id_municipio"], :name => "id_municipio"

  create_table "users", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "is_admin"
    t.string   "username",        :limit => 20, :null => false
  end

  add_index "users", ["email"], :name => "email", :unique => true

end
