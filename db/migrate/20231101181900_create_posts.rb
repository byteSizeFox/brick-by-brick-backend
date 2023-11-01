class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :image
      t.string :title
      t.string :time_spent
      t.integer :difficulty
      t.string :price
      t.text :review
      t.integer :user_id

      t.timestamps
    end
  end
end
