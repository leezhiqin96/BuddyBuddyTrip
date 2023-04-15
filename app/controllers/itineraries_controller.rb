class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
  end

  def create
  end
end
