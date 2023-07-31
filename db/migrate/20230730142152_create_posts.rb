class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :article
      t.integer :author_id
      t.string :thumbnail_image
      t.string :URL
      t.timestamps
    end
  end
end
