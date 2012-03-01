class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to(users_path, :notice => 'password had been changed')
    else
      render :action => "edit"
    end    
  end
end
