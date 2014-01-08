Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :blog_entries
  end
  
  resources :blog_entries

  match '/blog/tag/:tag', :to => 'blog_entries#tag', :as => :blog_tag, via: [:get]
  match '/blog/category/:category', :to => 'blog_entries#category', :as => :blog_category, via: [:get]
  match '/blog/author/:author', :to => 'blog_entries#author', :as => :blog_author, via: [:get]
  match '/blog/:year/:month/:day/:slug', :to => 'blog_entries#show', :as => :blog_entry_permalink, via: [:get]
  match '/blog/:year(/:month)(/:day)', :to => 'blog_entries#archive', :as => :news_archive,
    :constraints => {:year => /(19|20)\d{2}/, :month => /[01]?\d/, :day => /[0-3]?\d/}, via: [:get]
  match '/blog/feed', :to => 'blog_entries#feed', :as => :blog_feed, :format => :rss, via: [:get]
  match '/blog', :to => 'blog_entries#index', :as => :blog, via: [:get]
end