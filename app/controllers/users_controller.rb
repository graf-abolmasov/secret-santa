class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index
    if signed_in?
      @users = User.where('id != ?', current_user.id).all
    end
  end

  def edit

  end

  def update
    current_user.update_column(:generosity, params[:user][:generosity].to_i)
    redirect_to root_path
  end
end
