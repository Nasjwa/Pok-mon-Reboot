class PokeballsController < ApplicationController
  # Create from nested: /pokemons/:pokemon_id/pokeballs
  def create
    @pokemon  = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon

    # Optional 3: 50% chance to fail catching (unless already caught, which fails via validation anyway)
    if rand(2).zero?
      @trainers = Trainer.order(:name) # needed to re-render show
      flash.now[:alert] = "Oh no! #{@pokemon.name} escaped. Try again!"
      return render "pokemons/show", status: :unprocessable_entity
    end

    if @pokeball.save
      redirect_to pokemon_path(@pokemon), notice: "Gotcha! #{@pokemon.name} was caught."
    else
      @trainers = Trainer.order(:name)
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  # Optional 5: release to the wild (delete a pokeball)
  def destroy
    pokeball = Pokeball.find(params[:id])
    trainer  = pokeball.trainer
    name     = pokeball.pokemon.name
    pokeball.destroy
    redirect_to trainer_path(trainer), notice: "#{name} was released back into the wild."
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
