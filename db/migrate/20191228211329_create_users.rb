class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :city
      t.string :country
      t.integer :phone
      t.boolean :contractor
      t.boolean :contractee

      t.timestamps
    end
  end
end
