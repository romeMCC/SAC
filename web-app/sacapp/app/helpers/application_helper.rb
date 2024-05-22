module ApplicationHelper
    def breadcrumbs
        breadcrumbs = []
    
        # Add home breadcrumb
        breadcrumbs << link_to('Inicio', root_path)
    
        # Add additional breadcrumbs based on current page
        if controller_name == 'catalogs' && action_name == 'show'
          # Example for posts show page
          post = Catalog.find(params[:id])
          breadcrumbs << link_to('Catálogo', catalog_path(post))
        elsif controller_name == 'catalogs' && action_name == 'index'
            # Example for catalogs index page
            breadcrumbs << link_to('Catálogos', catalogs_path)
        elsif controller_name == 'catalogs' && action_name == 'new'
            # Example for catalogs new page
            breadcrumbs << link_to('Nuevo Catálogo', new_catalog_path)
        elsif controller_name == 'categories' && action_name == 'show'
          # Example for categories show page
          category = Category.find(params[:id])
          breadcrumbs << link_to(category.name, category_path(category))
        elsif controller_name == 'data_dictionaries' && action_name == 'index'
          # Example for catalogs index page
          breadcrumbs << link_to('Diccionario de datos', data_dictionaries_path)
        end
    
        breadcrumbs.join(' / ').html_safe
      end
end
