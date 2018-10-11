class Api::V1::SessionsController < ApplicationController
  # Used to login a user after a login request is recieved
  def login
    # Find the user by email in the database.
    @user = User.find_by(email_address: session_params[:email_address])

    # If the user exists and the password is correct.
    # Return the json with nessesary information.

    if @user && @user.authenticate(session_params[:password])
      # Create a token with the user's id and send json.
      token = issue_token({user_id: @user.id})

      # Create new user hash to avoid sending password_digest
      user = {
        id: @user.id,
        name: @user.name,
        email_address: @user.email_address
      }

      render json: {user: user, token: @token}
    else
      # Send json with error message
      error = "Invalid Login"
      render json: {error: message}
    end
  end


  # Used to create a user after a signup request in recieved
  def signup
    # Create a user with the given parameters
    @user = User.new(
      name: session_params[:name],
      email_address: session_params[:email_address],
      password: session_params[:password]
    )

    # If the email is used. Send JSON error message.
    if User.find_by(email_address: session_params[:email_address])
      error = "An account with the email address was already created."
      render json: {error: error}

    # If the submited passwords do not match. Send JSON error message.
    elsif session_params[:password] != session_params[:password_confirmation]
      error = "Passwords must match."
      render json: {error: error}

    # Create token with user id. Return JSON information.
    elsif @user.save
      token = issue_token({user_id: @user.id})

      # Create new user hash to avoid sending password_digest
      user = {
        id: @user.id,
        name: @user.name,
        email_address: @user.email_address
      }

      render json: {user: user, token: token}

    # If signup fails. Send JSON error message.
    else
      error = "Error signing up."
      render json: {error: error}
    end
  end



  # Used to login a user after a login request with a token in recieved
  def get_current_user
    # Determine if the user and token are vaild using -
    # - ApplicationController's current_user function
    @user = current_user

    if @user
      # Create new user hash to avoid sending password_digest
      user = {
        id: @user.id,
        name: @user.name,
        email_address: @user.email_address
      }

      # If the user exists. Send JSON of required information.
      render json: {user: user}
    else
      # If the user does not exist. Send JSON of error message.
      error_message = "Invalid user or token"
      render json: {error_message: error_message}
    end
  end


  private


  # Use strong parameters for api security.
  def session_params
    params.require(:session).permit(:name, :email_address, :password, :password_confirmation)
  end
end
