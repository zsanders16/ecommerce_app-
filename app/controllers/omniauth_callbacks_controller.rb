class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # request.env['omniauth.auth'] - all data from handshake
    @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
        else
        # something went wrong with registration on OAuth
        # @user.errors - to get any errors that happened
        redirect_to new_user_session_path
        end
    end

  # methods to handle each omniauth
end
