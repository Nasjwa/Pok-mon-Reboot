Rails.application.routes.draw do
  root to: "pokemons#index"

  resources :pokemons, only: [:index, :show] do
    resources :pokeballs, only: :create   # step 7: catch a pokemon
    collection { get :random }            # optional 4: random pokemon
  end

  resources :trainers, only: [:index, :show, :new, :create]  # step 5–6 + optional 1
  resources :pokeballs, only: :destroy    # optional 5: release
end
