require "application_system_test_case"

class DataDictionariesTest < ApplicationSystemTestCase
  setup do
    @data_dictionary = data_dictionaries(:one)
  end

  test "visiting the index" do
    visit data_dictionaries_url
    assert_selector "h1", text: "Data dictionaries"
  end

  test "should create data dictionary" do
    visit data_dictionaries_url
    click_on "New data dictionary"

    fill_in "Catalog", with: @data_dictionary.catalog_id
    fill_in "Created by", with: @data_dictionary.created_by
    fill_in "Current version", with: @data_dictionary.current_version
    fill_in "Description", with: @data_dictionary.description
    fill_in "Modification type", with: @data_dictionary.modification_type_id
    fill_in "Modified by", with: @data_dictionary.modified_by
    click_on "Create Data dictionary"

    assert_text "Data dictionary was successfully created"
    click_on "Back"
  end

  test "should update Data dictionary" do
    visit data_dictionary_url(@data_dictionary)
    click_on "Edit this data dictionary", match: :first

    fill_in "Catalog", with: @data_dictionary.catalog_id
    fill_in "Created by", with: @data_dictionary.created_by
    fill_in "Current version", with: @data_dictionary.current_version
    fill_in "Description", with: @data_dictionary.description
    fill_in "Modification type", with: @data_dictionary.modification_type_id
    fill_in "Modified by", with: @data_dictionary.modified_by
    click_on "Update Data dictionary"

    assert_text "Data dictionary was successfully updated"
    click_on "Back"
  end

  test "should destroy Data dictionary" do
    visit data_dictionary_url(@data_dictionary)
    click_on "Destroy this data dictionary", match: :first

    assert_text "Data dictionary was successfully destroyed"
  end
end
