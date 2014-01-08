require 'factory_girl'

FactoryGirl.define do
  factory :blog_entry, :class => Spree::BlogEntry do
    title 'A Blog Entry Title'
    body 'A Blog Entry Body'
    permalink {|entry| entry.title.to_url }
    published_at DateTime.new(2010)
    visible true
    summary 'A Blog Entry Summary'
  end
end
