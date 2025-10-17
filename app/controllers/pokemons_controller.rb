class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:name)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
