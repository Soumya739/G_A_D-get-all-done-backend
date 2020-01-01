class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :post_id
      t.integer :contractee_id
      t.integer :contractor_id

      t.timestamps
    end
  end
end
