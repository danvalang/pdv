require 'test_helper'

class TiendasControllerTest < ActionController::TestCase
  setup do
    @tienda = tiendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tienda" do
    assert_difference('Tienda.count') do
      post :create, tienda: { alcance_diageo: @tienda.alcance_diageo, area: @tienda.area, cadena: @tienda.cadena, canal: @tienda.canal, codigo_postal: @tienda.codigo_postal, comentario: @tienda.comentario, curt: @tienda.curt, determinante: @tienda.determinante, direccion: @tienda.direccion, estado: @tienda.estado, fases: @tienda.fases, fecha: @tienda.fecha, formato: @tienda.formato, imagen: @tienda.imagen, latitud: @tienda.latitud, longitud: @tienda.longitud, miguel: @tienda.miguel, municipio: @tienda.municipio, precision: @tienda.precision, region: @tienda.region, responsable: @tienda.responsable, serpel: @tienda.serpel, status_registro: @tienda.status_registro, status_tienda: @tienda.status_tienda, tienda: @tienda.tienda }
    end

    assert_redirected_to tienda_path(assigns(:tienda))
  end

  test "should show tienda" do
    get :show, id: @tienda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tienda
    assert_response :success
  end

  test "should update tienda" do
    put :update, id: @tienda, tienda: { alcance_diageo: @tienda.alcance_diageo, area: @tienda.area, cadena: @tienda.cadena, canal: @tienda.canal, codigo_postal: @tienda.codigo_postal, comentario: @tienda.comentario, curt: @tienda.curt, determinante: @tienda.determinante, direccion: @tienda.direccion, estado: @tienda.estado, fases: @tienda.fases, fecha: @tienda.fecha, formato: @tienda.formato, imagen: @tienda.imagen, latitud: @tienda.latitud, longitud: @tienda.longitud, miguel: @tienda.miguel, municipio: @tienda.municipio, precision: @tienda.precision, region: @tienda.region, responsable: @tienda.responsable, serpel: @tienda.serpel, status_registro: @tienda.status_registro, status_tienda: @tienda.status_tienda, tienda: @tienda.tienda }
    assert_redirected_to tienda_path(assigns(:tienda))
  end

  test "should destroy tienda" do
    assert_difference('Tienda.count', -1) do
      delete :destroy, id: @tienda
    end

    assert_redirected_to tiendas_path
  end
end
