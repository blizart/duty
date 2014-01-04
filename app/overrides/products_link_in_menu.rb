Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "products_link_in_menu",
                     :insert_after => "#home-link",
                     :text => "<li class='<%= (request.fullpath.gsub('//','/') == '/products') ? 'current' : 'not'%>'><%= link_to t('Products'), '/products'  %></li>")
