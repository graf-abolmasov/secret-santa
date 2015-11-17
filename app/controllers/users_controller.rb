class UsersController < ApplicationController
  def index
    if signed_in?
      @users = User.where('id != ?', current_user.id).all
    end
  end
end
