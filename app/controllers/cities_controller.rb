class CitiesController < ApplicationController
  
  def show
    @city = City.find(params[:id])
  end

  def new
  end
end
