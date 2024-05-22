require "test_helper"

class CatalogDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catalog_datum = catalog_data(:one)
  end

  test "should get index" do
    get catalog_data_url
    assert_response :success
  end

  test "should get new" do
    get new_catalog_datum_url
    assert_response :success
  end

  test "should create catalog_datum" do
    assert_difference("CatalogDatum.count") do
      post catalog_data_url, params: { catalog_datum: { catalog_id: @catalog_datum.catalog_id, created_by: @catalog_datum.created_by, modified_by: @catalog_datum.modified_by, tuples: @catalog_datum.tuples } }
    end

    assert_redirected_to catalog_datum_url(CatalogDatum.last)
  end

  test "should show catalog_datum" do
    get catalog_datum_url(@catalog_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_catalog_datum_url(@catalog_datum)
    assert_response :success
  end

  test "should update catalog_datum" do
    patch catalog_datum_url(@catalog_datum), params: { catalog_datum: { catalog_id: @catalog_datum.catalog_id, created_by: @catalog_datum.created_by, modified_by: @catalog_datum.modified_by, tuples: @catalog_datum.tuples } }
    assert_redirected_to catalog_datum_url(@catalog_datum)
  end

  test "should destroy catalog_datum" do
    assert_difference("CatalogDatum.count", -1) do
      delete catalog_datum_url(@catalog_datum)
    end

    assert_redirected_to catalog_data_url
  end
end
