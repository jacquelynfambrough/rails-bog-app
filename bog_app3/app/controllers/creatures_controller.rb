class CreaturesController < ApplicationController
  def index
    #store get all creatures in instance variable
    @creatures = Creature.all
    #render to index page
    render :index
  end
end
