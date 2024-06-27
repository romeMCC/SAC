class AddLockedToDataDictionaryFields < ActiveRecord::Migration[7.1]
  def change
    add_column :data_dictionary_fields, :locked, :boolean, default: false
  end
end
