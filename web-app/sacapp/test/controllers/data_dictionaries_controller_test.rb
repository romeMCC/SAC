require "test_helper"

class DataDictionariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_dictionary = data_dictionaries(:one)
  end

  test "should get index" do
    get data_dictionaries_url
    assert_response :success
  end

  test "should get new" do
    get new_data_dictionary_url
    assert_response :success
  end

  test "should create data_dictionary" do
    assert_difference("DataDictionary.count") do
      post data_dictionaries_url, params: { data_dictionary: { catalog_id: @data_dictionary.catalog_id, created_by: @data_dictionary.created_by, current_version: @data_dictionary.current_version, description: @data_dictionary.description, modification_type_id: @data_dictionary.modification_type_id, modified_by: @data_dictionary.modified_by } }
    end

    assert_redirected_to data_dictionary_url(DataDictionary.last)
  end

  test "should show data_dictionary" do
    get data_dictionary_url(@data_dictionary)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_dictionary_url(@data_dictionary)
    assert_response :success
  end

  test "should update data_dictionary" do
    patch data_dictionary_url(@data_dictionary), params: { data_dictionary: { catalog_id: @data_dictionary.catalog_id, created_by: @data_dictionary.created_by, current_version: @data_dictionary.current_version, description: @data_dictionary.description, modification_type_id: @data_dictionary.modification_type_id, modified_by: @data_dictionary.modified_by } }
    assert_redirected_to data_dictionary_url(@data_dictionary)
  end

  test "should destroy data_dictionary" do
    assert_difference("DataDictionary.count", -1) do
      delete data_dictionary_url(@data_dictionary)
    end

    assert_redirected_to data_dictionaries_url
  end
end
