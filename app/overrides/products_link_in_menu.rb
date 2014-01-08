Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "products_link_in_menu",
                     :insert_after => "#home-link",
                     :text => "<li class='<%= (request.fullpath.gsub('//','/') == '/products') ? 'current' : 'not'%>'><%= link_to t('Products'), '/products'  %></li>")

Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "blog_link_in_menu",
                     :insert_bottom => "#main-nav-bar",
                     :text => "<li class='<%= (request.fullpath.gsub('//','/') == '/blog') ? 'current' : 'not'%>'><%= link_to t('Blog'), '/blog'  %></li>")

