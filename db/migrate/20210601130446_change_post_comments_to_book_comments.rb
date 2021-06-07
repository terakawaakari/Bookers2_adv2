class ChangePostCommentsToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :post_comments, :book_comments
  end
end
