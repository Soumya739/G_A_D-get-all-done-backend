class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :contractee_id
      t.integer :contractor_id
      t.integer :category_id
      t.string :status

      t.timestamps
    end
  end
end
