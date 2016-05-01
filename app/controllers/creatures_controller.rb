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
    if creature.save
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

  def edit
    #get the creature id from the url params
    creature_id = params[:id]
    #use "creature_id" to find the creature in the db
    #and save it to an instance var
    @creature = Creature.find_by_id(creature_id)
    render :edit
  end

  def update
    #get creature id from url params
    creature_id = params[:id]

    #use id var to find creature in db and save to instance var
    creature = Creature.find_by_id(creature_id)

    #whitelist params and save them to var
    creature_params = params.require(:creature).permit(:name, :description)

    #update creature
    creature.update_attributes(creature_params)

    #redirecto to show page
    redirect_to creature_path(creature)
    #redirect to creature_path (creature) is same as redirect_to "/creatures/#{creature.id}"
  end

  def destroy
    # get creature id from url params
    creature_id = params[:id]
    #use creature_id to find the creature in the db and save to inst. var
    creature = Creature.find_by_id(creature_id)
    #destroy creature
    creature.destroy
    #redirect to index
    redirect_to creatures_path

  end

end
