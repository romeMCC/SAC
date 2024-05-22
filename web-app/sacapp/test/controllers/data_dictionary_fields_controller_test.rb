require "test_helper"

class DataDictionaryFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_dictionary_field = data_dictionary_fields(:one)
  end

  test "should get index" do
    get data_dictionary_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_data_dictionary_field_url
    assert_response :success
  end

  test "should create data_dictionary_field" do
    assert_difference("DataDictionaryField.count") do
      post data_dictionary_fields_url, params: { data_dictionary_field: { created_by: @data_dictionary_field.created_by, data_dictionary_id: @data_dictionary_field.data_dictionary_id, field_description: @data_dictionary_field.field_description, field_name: @data_dictionary_field.field_name, field_type_id: @data_dictionary_field.field_type_id, modified_by: @data_dictionary_field.modified_by, version: @data_dictionary_field.version } }
    end

    assert_redirected_to data_dictionary_field_url(DataDictionaryField.last)
  end

  test "should show data_dictionary_field" do
    get data_dictionary_field_url(@data_dictionary_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_dictionary_field_url(@data_dictionary_field)
    assert_response :success
  end

  test "should update data_dictionary_field" do
    patch data_dictionary_field_url(@data_dictionary_field), params: { data_dictionary_field: { created_by: @data_dictionary_field.created_by, data_dictionary_id: @data_dictionary_field.data_dictionary_id, field_description: @data_dictionary_field.field_description, field_name: @data_dictionary_field.field_name, field_type_id: @data_dictionary_field.field_type_id, modified_by: @data_dictionary_field.modified_by, version: @data_dictionary_field.version } }
    assert_redirected_to data_dictionary_field_url(@data_dictionary_field)
  end

  test "should destroy data_dictionary_field" do
    assert_difference("DataDictionaryField.count", -1) do
      delete data_dictionary_field_url(@data_dictionary_field)
    end

    assert_redirected_to data_dictionary_fields_url
  end
end
