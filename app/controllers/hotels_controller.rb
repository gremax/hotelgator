class HotelsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def top
    @hotels = Hotel.top
  end

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @comments = @hotel.comments
  end

  def new
    @hotel = Hotel.new
    @hotel.build_address
  end

  def create
    @hotel = current_user.hotels.new(hotel_params)
    @hotel.picture = upload_picture(params[:hotel][:picture])
    if @hotel.save
      redirect_to @hotel, notice: "The hotel successfully added"
    else
      flash.now[:alert] = "You have some errors!"
      render :new
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:title, :rating, :breakfast,
                           :room_description, :price, address_attributes: 
                           [:country, :state, :city, :street])
  end
  
  def upload_picture(image)
    image_name = (Time.now.to_i.to_s + 
                  File.extname(image.original_filename)).downcase
    File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
      file.write(image.read)
    end
    image_name
  end
end
