class AddDataDictionaryIdToCatalogsData < ActiveRecord::Migration[7.1]
  def change
    add_reference :catalog_data, :data_dictionary, null: false, foreign_key: true, type: :uuid
  end
end
