class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include MembersHelper
  include TasksHelper
  include GroupsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Por favor acesse sua conta"
        redirect_to login_url
      end
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
      user == current_user
    end
end
