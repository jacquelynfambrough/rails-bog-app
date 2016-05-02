class CreaturesController < ApplicationController
  def index
    #get all creatures from db and save in instance var
    @creatures = Creature.all
    #render to index page
    render :index
  end
end
