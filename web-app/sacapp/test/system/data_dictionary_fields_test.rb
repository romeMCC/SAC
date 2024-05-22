require "application_system_test_case"

class DataDictionaryFieldsTest < ApplicationSystemTestCase
  setup do
    @data_dictionary_field = data_dictionary_fields(:one)
  end

  test "visiting the index" do
    visit data_dictionary_fields_url
    assert_selector "h1", text: "Data dictionary fields"
  end

  test "should create data dictionary field" do
    visit data_dictionary_fields_url
    click_on "New data dictionary field"

    fill_in "Created by", with: @data_dictionary_field.created_by
    fill_in "Data dictionary", with: @data_dictionary_field.data_dictionary_id
    fill_in "Field description", with: @data_dictionary_field.field_description
    fill_in "Field name", with: @data_dictionary_field.field_name
    fill_in "Field type", with: @data_dictionary_field.field_type_id
    fill_in "Modified by", with: @data_dictionary_field.modified_by
    fill_in "Version", with: @data_dictionary_field.version
    click_on "Create Data dictionary field"

    assert_text "Data dictionary field was successfully created"
    click_on "Back"
  end

  test "should update Data dictionary field" do
    visit data_dictionary_field_url(@data_dictionary_field)
    click_on "Edit this data dictionary field", match: :first

    fill_in "Created by", with: @data_dictionary_field.created_by
    fill_in "Data dictionary", with: @data_dictionary_field.data_dictionary_id
    fill_in "Field description", with: @data_dictionary_field.field_description
    fill_in "Field name", with: @data_dictionary_field.field_name
    fill_in "Field type", with: @data_dictionary_field.field_type_id
    fill_in "Modified by", with: @data_dictionary_field.modified_by
    fill_in "Version", with: @data_dictionary_field.version
    click_on "Update Data dictionary field"

    assert_text "Data dictionary field was successfully updated"
    click_on "Back"
  end

  test "should destroy Data dictionary field" do
    visit data_dictionary_field_url(@data_dictionary_field)
    click_on "Destroy this data dictionary field", match: :first

    assert_text "Data dictionary field was successfully destroyed"
  end
end
