class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(
      user: User.find(like_params[:user_id])
      challenge: Challenge.find(like_params[:challenge_id])
    )

    if @like.save
      render json: {like: @like}
    else
      error = "Unable to save like"
      render json: {error: error}
    end
  end

  def delete
    @user = User.find(like_params[:user_id])
    @challenge = Challenge.find(like_params[:challenge_id])

    if current_user != @user
      error = "Account error."
      render json: {error: error}
    elsif @like && @like.destroy
      message = "Like removed."
      render json: {message: message}
    else
      error = "Unable to remove like."
      render json: {error: error}
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :challenge_id)
  end
end
