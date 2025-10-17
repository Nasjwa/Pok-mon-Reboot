class PokemonsController < ApplicationController
  def index
    if params[:q].present?
      @query = params[:q].strip
      @pokemons = Pokemon.where("name ILIKE ?", "%#{@query}%").order(:name)
    else
      @pokemons = Pokemon.order(:name)
    end
  end

  def show
    @pokemon  = Pokemon.find(params[:id])
    @pokeball = Pokeball.new
    @trainers = Trainer.order(:name)
  end

  def random
    pokemon = Pokemon.order("RANDOM()").first
    redirect_to pokemon_path(pokemon)
  end
end
