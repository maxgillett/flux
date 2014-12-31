Rails.application.routes.draw do
  root to: 'pages#home'

  resource :articles do
    collection do 
      get 'search'
      get 'refresh'
      post 'mark_as_read'
    end
  end
end
