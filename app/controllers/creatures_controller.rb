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
    if creature.save
      redirect_to creature_path(creature)
      # redirect_to creatures_path is equivalent to:
      # redirect_to "/creatures"
    end
  end
  def show
    #get creature by id, store in creature_id var
    creature_id = params[:id]
    #creating instance var in which store the found creature is stored
    @creature = Creature.find_by_id(creature_id)
    #render creature to page
    render :show
  end
  def edit
    #get creature by id, store in creature_id var
    creature_id = params[:id]
    #creating instance var in which the found creature is stored
    @creature = Creature.find_by_id(creature_id)
    #render creature to page
    render :edit
  end
  def update
    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature_params = params.require(:creature).permit(:name, :description)

    creature.update_attributes(creature_params)

    redirect_to creature_path(creature)
  end

end
