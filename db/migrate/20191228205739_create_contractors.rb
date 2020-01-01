class CreateContractors < ActiveRecord::Migration[6.0]
  def change
    create_table :contractors do |t|
      t.integer :user_id
      # t.text :reviews, array: true, default: []
      t.integer :projects_completed
      t.string :services, array: true, default: []
      t.string :password_digest

      t.timestamps
    end
  end
end
