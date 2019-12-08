class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new

  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    pokemon.save
    redirect_to pokemons_path(@pokemon)
  end

  def edit
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to pokemons_path
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_path
  end


  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight, :location, :type_id)
  end
end
