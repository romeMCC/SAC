class CreateCatalogData < ActiveRecord::Migration[7.1]
  def change
    create_table :catalog_data, id: :uuid do |t|
      t.references :catalog, null: false, foreign_key: true, type: :uuid
      t.json :tuples
      t.uuid :created_by
      t.uuid :modified_by

      t.timestamps
    end
  end
end
