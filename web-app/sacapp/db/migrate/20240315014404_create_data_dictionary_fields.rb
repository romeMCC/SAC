class CreateDataDictionaryFields < ActiveRecord::Migration[7.1]
  def change
    create_table :data_dictionary_fields, id: :uuid do |t|
      t.references :data_dictionary, null: false, foreign_key: true, type: :uuid
      t.string :field_name
      t.references :field_type, null: false, foreign_key: true, type: :uuid
      t.string :field_description
      t.uuid :created_by
      t.uuid :modified_by

      t.timestamps
    end
  end
end
