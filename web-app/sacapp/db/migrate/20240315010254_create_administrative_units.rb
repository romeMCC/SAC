class CreateAdministrativeUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :administrative_units, id: :uuid do |t|
      t.string :name
      t.string :initials
      t.string :code
      t.references :organism, null: false, foreign_key: true, type: :uuid
      t.uuid :created_by
      t.uuid :modified_by

      t.timestamps
    end
  end
end
