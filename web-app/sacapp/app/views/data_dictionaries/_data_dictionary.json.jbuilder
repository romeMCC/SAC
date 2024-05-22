json.extract! data_dictionary, :id, :current_version, :modification_type_id, :description, :catalog_id, :created_by, :modified_by, :created_at, :updated_at
json.url data_dictionary_url(data_dictionary, format: :json)
