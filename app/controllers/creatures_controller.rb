class CreaturesController < ApplicationController
  def index
    #store get all creatures in instance variable
    @creatures = Creature.all
    #render to index page
    render :index
  end
  def new
    @creature = Creature.new
    #render new data to "new" page
    render :new
  end
  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)

    # if creature saves, redirect to route that displays all creatures
    if creature.saves
      redirect_to creatures_path
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end
end
