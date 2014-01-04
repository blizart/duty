# This migration comes from spree_multilingual_static_content (originally 20130910124033)
class MultilingualPagesTable < ActiveRecord::Migration
  def up
    params = { :title => :string, :body => :text}
    Spree::Page.create_translation_table!(params, { :migrate_data => true })
  end

  def down
    Spree::Page.drop_translation_table! :migrate_data => true
  end
end
