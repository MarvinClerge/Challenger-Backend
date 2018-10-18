class Api::V1::ChallengesController < ApplicationController
  # Used to provide information on all challenges.
  def index
    # Restructure challenges and return as JSON.
    @challenges = restructure_challenges(Challenge.all)
    render json: {challenges: @challenges}
  end

  # Used to provide information on single challenge.
  def show
    # Find the challenge in database to see if it exsits.
    @challenge = Challenge.find(params[:id])

    if @challenge
      # Restructure challenge and return as JSON.
      @challenge = restructure_challenge(@challenge)
      render json: {challenge: @challenge}
    else
      # Return JSON with error message.
      error = "Challenge with that id does not exsits"
      render json: {error: error}
    end
  end

  # Used to change all challenges to hashes.
  # Adds challenge's likes and user_challenges to hash.
  def restructure_challenges(challenges)
    challenge_array = []

    challenges.each do |challenge|
      challenge_array.push({
        name: challenge.name,
        description: challenge.description,
        content: challenge.content,
        test: challenge.test,
        user_challenges: challenge.user_challenges.count
      })
    end

    return challenge_array
  end

  # Used to change single challenge to hash for the show route.
  # Adds challenge's likes to hash.
  def restructure_challenge(challenge)
    return {
      name: challenge.name,
      description: challenge.description,
      content: challenge.content,
      test: challenge.test
    }
  end
end
