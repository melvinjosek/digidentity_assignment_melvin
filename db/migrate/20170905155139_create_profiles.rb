class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :account
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.boolean :confirmed

      t.timestamps
    end
  end
end
