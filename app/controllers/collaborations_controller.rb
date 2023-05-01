class CollaborationsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @collaboration = Collaboration.new
    # @collaboration.itinerary = @itinerary
    authorize @itinerary
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    authorize @itinerary

    # Takes in collaboration parameters and find the user by username or email
    user = Collaboration.find_user(collaboration_params[:user])

    @collaboration = Collaboration.new(itinerary: @itinerary, user:, role: collaboration_params[:role])

    if @collaboration.save
      redirect_to edit_itinerary_path(@itinerary)
    else
      flash[:alert] = "User not found."
      render "collaborations/new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:role, user: %i[email username])
  end
end
