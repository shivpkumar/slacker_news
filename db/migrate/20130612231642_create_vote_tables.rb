class CreateVoteTables < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.references :user, :post
    end

    create_table :comment_votes do |t|
      t.references :user, :comment
    end
  end
end
