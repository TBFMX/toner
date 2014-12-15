Rails.application.routes.draw do
  resources :brands

  resources :line_items

  resources :carts

  get 'store/index'

  controller :cartuchos do 
    get 'cartuchos/new' => :new
    get 'cartuchos/edit/:id' => :edit, :as => 'edit_cartucho'
    get 'cartucho/:id' => :show
    post 'cartuchos' =>:create
    post 'cartuchos/:id' => :update
    get 'cartuchos/' => :index
    get 'cartucho' => :index
    post 'cartucho' => :index , :as => 'seleccion'
    get 'cartuchos/lista' =>:list , :as => 'list'
    post '/search' => :searcher, :as => 'search'
    get '/search' => :searcher
    post '/BuscarXImpresora' => :search_imp, :as => 'search2'
    post 'upload' => :upload , :as => 'upload'
    post 'cartuchos/upload' => :upload 
    get 'subir' => :import, :as => 'import'
  end


  controller :store do
    get 'quienes/' => :quienes, :as => 'quienes'
    get 'distribuidores/' => :distribuidores, :as => 'distribuidores'    
    get 'contacto/' => :contacto, :as => 'contacto'
    get 'renta/' => :renta, :as => 'renta'    
    get 'cartuchos_compatibles/' => :cartuchos_compatibles, :as => 'cartuchos_compatibles'
    get 'cartuchos_originales/' => :cartuchos_originales, :as => 'cartuchos_originales'
    get 'impresoras_otros/' => :impresoras_otros, :as => 'impresoras_otros'
    post 'contacto/' => :contacto_send, :as => 'sender' #sender_path
    get 'presupuesto/' => :presupuesto, :as => 'presupuesto'
    post 'presupuesto/' => :presupuesto_send, :as => 'presupuesto_sender' #sender_path
  end  



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'store#index', as: 'store'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
