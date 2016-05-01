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
      redirect_to creature_path(creature)
      # redirect_to creatures_path is equivalent to redirect_to "/creatures/#{creature.id}"
    end
  end

  def show
    #get the creature id from the url params
    creature_id = params[:id]
    #use "creature_id" to find the creature in the database
    #and save it to an instance var
    @creature = Creature.find_by_id(creature_id)

    #render the show view (it has access to instance variable)
    render :show

  end
end
