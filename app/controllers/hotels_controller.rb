class HotelsController < ApplicationController
  before_action :authenticate_user
  
  def top
    @hotels = Hotel.top
  end

  def index
    @hotels = Hotel.all
  end
    
  def show
    @hotel = Hotel.find(params[:id])
  end
  
  def new
    @hotel = Hotel.new
    @hotel.build_address
  end
  
  def create
    @hotel = current_user.hotels.new(hotel_params)
    if @hotel.save
      redirect_to @hotel, notice: "The hotel successfully added"
    else
      render :new
    end
  end
    
  private
  
  def hotel_params
    params.require(:hotel).permit(:title, :rating, :breakfast, 
                           :room_description, :price, address_attributes: 
                           [:country, :state, :city, :street])
  end
end