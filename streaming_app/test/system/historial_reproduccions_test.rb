require "application_system_test_case"

class HistorialReproduccionsTest < ApplicationSystemTestCase
  setup do
    @historial_reproduccion = historial_reproduccions(:one)
  end

  test "visiting the index" do
    visit historial_reproduccions_url
    assert_selector "h1", text: "Historial reproduccions"
  end

  test "should create historial reproduccion" do
    visit historial_reproduccions_url
    click_on "New historial reproduccion"

    fill_in "Episodio", with: @historial_reproduccion.episodio_id
    fill_in "Perfil", with: @historial_reproduccion.perfil_id
    fill_in "Segundo detenido", with: @historial_reproduccion.segundo_detenido
    fill_in "Ultima conexion", with: @historial_reproduccion.ultima_conexion
    check "Visto completo" if @historial_reproduccion.visto_completo
    click_on "Create Historial reproduccion"

    assert_text "Historial reproduccion was successfully created"
    click_on "Back"
  end

  test "should update Historial reproduccion" do
    visit historial_reproduccion_url(@historial_reproduccion)
    click_on "Edit this historial reproduccion", match: :first

    fill_in "Episodio", with: @historial_reproduccion.episodio_id
    fill_in "Perfil", with: @historial_reproduccion.perfil_id
    fill_in "Segundo detenido", with: @historial_reproduccion.segundo_detenido
    fill_in "Ultima conexion", with: @historial_reproduccion.ultima_conexion.to_s
    check "Visto completo" if @historial_reproduccion.visto_completo
    click_on "Update Historial reproduccion"

    assert_text "Historial reproduccion was successfully updated"
    click_on "Back"
  end

  test "should destroy Historial reproduccion" do
    visit historial_reproduccion_url(@historial_reproduccion)
    click_on "Destroy this historial reproduccion", match: :first

    assert_text "Historial reproduccion was successfully destroyed"
  end
end
