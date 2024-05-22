require "application_system_test_case"

class CatalogDataTest < ApplicationSystemTestCase
  setup do
    @catalog_datum = catalog_data(:one)
  end

  test "visiting the index" do
    visit catalog_data_url
    assert_selector "h1", text: "Catalog data"
  end

  test "should create catalog datum" do
    visit catalog_data_url
    click_on "New catalog datum"

    fill_in "Catalog", with: @catalog_datum.catalog_id
    fill_in "Created by", with: @catalog_datum.created_by
    fill_in "Modified by", with: @catalog_datum.modified_by
    fill_in "Tuples", with: @catalog_datum.tuples
    click_on "Create Catalog datum"

    assert_text "Catalog datum was successfully created"
    click_on "Back"
  end

  test "should update Catalog datum" do
    visit catalog_datum_url(@catalog_datum)
    click_on "Edit this catalog datum", match: :first

    fill_in "Catalog", with: @catalog_datum.catalog_id
    fill_in "Created by", with: @catalog_datum.created_by
    fill_in "Modified by", with: @catalog_datum.modified_by
    fill_in "Tuples", with: @catalog_datum.tuples
    click_on "Update Catalog datum"

    assert_text "Catalog datum was successfully updated"
    click_on "Back"
  end

  test "should destroy Catalog datum" do
    visit catalog_datum_url(@catalog_datum)
    click_on "Destroy this catalog datum", match: :first

    assert_text "Catalog datum was successfully destroyed"
  end
end
