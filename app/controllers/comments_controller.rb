class CommentsController < ApplicationController
  before_filter :authenticate_user
  
  def create
    hotel = Hotel.find(params[:hotel_id])
    comment = hotel.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to hotel, notice: "Thanks! Your comment successfully added."
    else
      redirect_to hotel, alert: "The comment can't be blank." 
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:rating, :text)
  end
end