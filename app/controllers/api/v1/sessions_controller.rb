class Api::V1::SessionsController < ApplicationController
  # Used to login a user after a login request is recieved
  def login
    # Find the user by email in the database.
    @user = User.find_by(email: session_params[:email])

    # If the user exists and the password is correct.
    # Return the json with nessesary information.

    if @user && @user.authenticate(session_params[:password])
      # Create a token with the user's id and send json.
      token = issue_token({user_id: @user.id})
      render json: {user: @user, token: @token}
    else
      # Send json with error message
      message = "Invalid Login"
      render json: {message: message}
    end
  end


  # Used to create a user after a signup request in recieved
  def signup
    # Check if the user with that email account is already being used.
    @user = User.find_by(email_address: session_params[:email_address])

    # If the user does exist. Send JSON of an error message.
    if @user
      message = "An account with the email was already created"
      render json: {message: message}
    end

    # If the submited passwords do not match. Send JSON of error message.
    if session_params[:password] != session_params[:password_confirmation]
      message = "Passwords must match"
      render json: {message: message}
    end

    # Create a user with the given parameters
    @user = User.new(
      name: session_params[:name],
      email_address: session_params[:email_address],
      password: session_params[:password]
    )

    # Create a token with the user's id. Send JSON with required information
    if @user.save
      token = issue_token({user_id: @user.id})
      render json: {user: @user, token: token}
    end
  end


  # Used to login a user after a login request with a token in recieved
  def get_current_user
    # Determine if the user and token are vaild using -
    # - ApplicationController's current_user function
    @user = current_user

    if @user
      # If the user exists. Send JSON of required information.
      render json: {user: @user}
    else
      # If the user does not exist. Send JSON of error message.
      error_message = "Invalid user or token"
      render json: {error_message: error_message}
    end
  end


  private

  # Use strong parameters for api security
  def session_params
    require(:session).permit(:name, :email_address, :password, :password_confirmation)
  end
end
