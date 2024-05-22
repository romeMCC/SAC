json.extract! data_dictionary_field, :id, :data_dictionary_id, :version, :field_name, :field_type_id, :field_description, :created_by, :modified_by, :created_at, :updated_at
json.url data_dictionary_field_url(data_dictionary_field, format: :json)
