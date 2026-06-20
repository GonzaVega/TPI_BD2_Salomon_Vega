require "application_system_test_case"

class CatalogosTest < ApplicationSystemTestCase
  setup do
    @catalogo = catalogos(:one)
  end

  test "visiting the index" do
    visit catalogos_url
    assert_selector "h1", text: "Catalogos"
  end

  test "should create catalogo" do
    visit catalogos_url
    click_on "New catalogo"

    fill_in "Clasificacion", with: @catalogo.clasificacion
    check "Disponible" if @catalogo.disponible
    fill_in "Lanzamiento", with: @catalogo.lanzamiento
    fill_in "Sinopsis", with: @catalogo.sinopsis
    fill_in "Tipo", with: @catalogo.tipo
    fill_in "Titulo", with: @catalogo.titulo
    click_on "Create Catalogo"

    assert_text "Catalogo was successfully created"
    click_on "Back"
  end

  test "should update Catalogo" do
    visit catalogo_url(@catalogo)
    click_on "Edit this catalogo", match: :first

    fill_in "Clasificacion", with: @catalogo.clasificacion
    check "Disponible" if @catalogo.disponible
    fill_in "Lanzamiento", with: @catalogo.lanzamiento
    fill_in "Sinopsis", with: @catalogo.sinopsis
    fill_in "Tipo", with: @catalogo.tipo
    fill_in "Titulo", with: @catalogo.titulo
    click_on "Update Catalogo"

    assert_text "Catalogo was successfully updated"
    click_on "Back"
  end

  test "should destroy Catalogo" do
    visit catalogo_url(@catalogo)
    click_on "Destroy this catalogo", match: :first

    assert_text "Catalogo was successfully destroyed"
  end
end
