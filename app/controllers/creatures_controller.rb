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
      redirect_to creature_path (creature)
    end
  end
  def show
    creature_id = params[:id]

    @creature = Creature.find_by_id(creature_id)

    render :show
  end
  def edit
    creature_id = params[:id]

    @creature = Creature.find_by_id (creature_id)

    render :edit

  end
  def update

    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature_params = params.require(:creature).permit(:name, :description)

    creature.update_attributes(creature_params)

    redirect_to creature_path (creature)
  end

  def delete
    creature_id = params[:id]

    creature = Creature.find_by_id (creature_id)

    creature.destroy

    redirect_to creatures_path
  end
end
