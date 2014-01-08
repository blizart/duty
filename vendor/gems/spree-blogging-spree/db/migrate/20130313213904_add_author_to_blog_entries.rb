class AddAuthorToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :author, :string
  end
end
