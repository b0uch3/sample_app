class VenuesController < ApplicationController

  def show
    @venue = Venue.find(params[:id])
  end

  def new
  end
end
