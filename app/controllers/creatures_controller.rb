class CreaturesController < ApplicationController
  def index
    #get all creatures from db and save in instance var
    @creatures = Creature.all
    #render to index page
    render :index
  end
  def new
    @creature = Creature.new
    render :new
  end
  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    #create new creature from creature_params
    creature = Creature.new(creature_params)

    #if creature saves, redirect to route that displays all creatures
    if creature.save
      redirect_to creatures_path
    end
  end
end
