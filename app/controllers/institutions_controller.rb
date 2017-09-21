class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  #def show
    #@institutions = Institution.find(params[:id])
  #end

  #def new
  #end
end
