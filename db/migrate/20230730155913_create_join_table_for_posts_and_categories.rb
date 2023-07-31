class CreateJoinTableForPostsAndCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :categories do |t|
    end
  end
end
