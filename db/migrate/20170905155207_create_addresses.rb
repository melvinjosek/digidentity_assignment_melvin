class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :account
      t.string :street
      t.string :house_number
      t.string :postcode
      t.boolean :confirmed

      t.timestamps
    end
  end
end
