Dradis::Plugins::Calculators::DREAD::Engine.routes.draw do
  get '/calculators/dread' => 'base#index'

  resources :projects, only: [] do
    resources :issues, only: [] do
      member do
        get 'dread' => 'issues#edit'
        patch 'dread' => 'issues#update'
      end
    end
  end
end
