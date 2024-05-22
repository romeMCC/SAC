require "application_system_test_case"

class CatalogsTest < ApplicationSystemTestCase
  setup do
    @catalog = catalogs(:one)
  end

  test "visiting the index" do
    visit catalogs_url
    assert_selector "h1", text: "Catalogs"
  end

  test "should create catalog" do
    visit catalogs_url
    click_on "New catalog"

    fill_in "Created by", with: @catalog.created_by
    fill_in "Description", with: @catalog.description
    fill_in "Modified by", with: @catalog.modified_by
    fill_in "Name", with: @catalog.name
    click_on "Create Catalog"

    assert_text "Catalog was successfully created"
    click_on "Back"
  end

  test "should update Catalog" do
    visit catalog_url(@catalog)
    click_on "Edit this catalog", match: :first

    fill_in "Created by", with: @catalog.created_by
    fill_in "Description", with: @catalog.description
    fill_in "Modified by", with: @catalog.modified_by
    fill_in "Name", with: @catalog.name
    click_on "Update Catalog"

    assert_text "Catalog was successfully updated"
    click_on "Back"
  end

  test "should destroy Catalog" do
    visit catalog_url(@catalog)
    click_on "Destroy this catalog", match: :first

    assert_text "Catalog was successfully destroyed"
  end
end
