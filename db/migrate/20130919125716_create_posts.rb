class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.boolean :deleted, default: false
      t.string :author
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
