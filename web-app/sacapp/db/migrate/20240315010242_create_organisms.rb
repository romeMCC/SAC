class CreateOrganisms < ActiveRecord::Migration[7.1]
  def change
    create_table :organisms, id: :uuid do |t|
      t.string :name
      t.string :initials
      t.string :code
      t.uuid :created_by
      t.uuid :modified_by

      t.timestamps
    end
  end
end
