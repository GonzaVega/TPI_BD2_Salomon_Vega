require "test_helper"

class HistorialReproduccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historial_reproduccion = historial_reproduccions(:one)
  end

  test "should get index" do
    get historial_reproduccions_url
    assert_response :success
  end

  test "should get new" do
    get new_historial_reproduccion_url
    assert_response :success
  end

  test "should create historial_reproduccion" do
    assert_difference("HistorialReproduccion.count") do
      post historial_reproduccions_url, params: { historial_reproduccion: { episodio_id: @historial_reproduccion.episodio_id, perfil_id: @historial_reproduccion.perfil_id, segundo_detenido: @historial_reproduccion.segundo_detenido, ultima_conexion: @historial_reproduccion.ultima_conexion, visto_completo: @historial_reproduccion.visto_completo } }
    end

    assert_redirected_to historial_reproduccion_url(HistorialReproduccion.last)
  end

  test "should show historial_reproduccion" do
    get historial_reproduccion_url(@historial_reproduccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_historial_reproduccion_url(@historial_reproduccion)
    assert_response :success
  end

  test "should update historial_reproduccion" do
    patch historial_reproduccion_url(@historial_reproduccion), params: { historial_reproduccion: { episodio_id: @historial_reproduccion.episodio_id, perfil_id: @historial_reproduccion.perfil_id, segundo_detenido: @historial_reproduccion.segundo_detenido, ultima_conexion: @historial_reproduccion.ultima_conexion, visto_completo: @historial_reproduccion.visto_completo } }
    assert_redirected_to historial_reproduccion_url(@historial_reproduccion)
  end

  test "should destroy historial_reproduccion" do
    assert_difference("HistorialReproduccion.count", -1) do
      delete historial_reproduccion_url(@historial_reproduccion)
    end

    assert_redirected_to historial_reproduccions_url
  end
end
