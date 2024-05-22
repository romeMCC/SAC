class CreateModificationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :modification_types, id: :uuid do |t|
      t.string :name
      t.string :description
      t.uuid :created_by
      t.uuid :modified_by

      t.timestamps
    end
  end
end
