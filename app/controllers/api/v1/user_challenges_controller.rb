class Api::V1::UserChallengeController < ApplicationController
  def create
    @user_challenge = UserChallenge.new(
      user: User.find(user_challenge_params[:user_id])
      challenge: User.find(user_challenge_params[:challenge_id])
    )

    if @user_challenge.save
      render json: {user_challenge: @user_challenge}
    else
      error = "Unable to save completion"
      render json: {error: error}
    end
  end

  private

  def user_challenge_params
    params.require(:user_challenge).permit(:user_id, :challenge_id)
  end
end
