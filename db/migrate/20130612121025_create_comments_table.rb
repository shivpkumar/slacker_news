class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :post
      t.references :user
    end
  end
end
