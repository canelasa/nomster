class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:place_id])
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user), :notice => "comment Deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
