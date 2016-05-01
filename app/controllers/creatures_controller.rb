class CreaturesController < ApplicationController
  def index
    #get all creatures from db and save to instance variable
    @creatures = Creature.all
    #render the index view (it has access to instance var)
    render :index
  end

  def new
    @creature = Creature.new

    render :new
  end

  def create
    #whitelist params and save them to variable
    creature_params = params.require(:creature).permit(:name, :description)
    #create a new creature from creature_params
    creature = Creature.new(creature_params)

    #if creatures saves, redirecte to route that displays all creatures
    if creature.saves
      redirect_to creatures_path
      # redirect_to creatures_path is equivalent to redirect_to "/creatures"
    end
  end

end
