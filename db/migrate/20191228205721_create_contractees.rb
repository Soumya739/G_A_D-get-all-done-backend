class CreateContractees < ActiveRecord::Migration[6.0]
  def change
    create_table :contractees do |t|
      t.integer :user_id
      # t.text :reviews, array: true, default: []

      t.timestamps
    end
  end
end
