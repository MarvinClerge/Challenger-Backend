class Api::V1::ChallengesController < ApplicationController
  # Used to provide information on all challenges when requested.
  def index
    # Call restructure_challenge fuction with all challenges.
    @challenges = restructure_challenge(Challenge.all)
    # Return JSON with required information.
    render json: {challenges: @challenges}
  end


  # Used to change Challenges from ActiveRecord to hash -
  # - that includes the challenge's likes and user_challenges.
  def restructure_challenge(challenges)
    # Collector array to store restructured challenges.
    challenge_array = []

    # Iterate through each challenge. Create hash with challenge information.
    # Push hash into collector array.
    challenges.each do |challenge|
      challenge_array.push({
        name: challenge.name,
        description: challenge.description,
        category: challenge.category,
        content: challenge.content,
        test: challenge.test,
        likes: challenge.likes.count,
        user_challenges: challenge.user_challenges.count
      })
    end

    # Return the collector array of restructured challenges.
    return challenge_array
  end
end
