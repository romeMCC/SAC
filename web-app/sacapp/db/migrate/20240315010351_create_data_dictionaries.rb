class CreateDataDictionaries < ActiveRecord::Migration[7.1]
  def change
    create_table :data_dictionaries, id: :uuid do |t|
      t.string :version
      t.references :modification_type, null: false, foreign_key: true, type: :uuid
      t.string :description
      t.references :catalog, null: false, foreign_key: true, type: :uuid
      t.uuid :created_by
      t.uuid :modified_by
      t.boolean :current_version, default: false
      
      t.timestamps
    end
  end
end
