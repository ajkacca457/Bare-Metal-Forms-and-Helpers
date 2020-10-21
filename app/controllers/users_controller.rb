class UsersController < ApplicationController

def new
@user=User.new
end

def create
#render plain: params[:user].inspect
@user=User.new(user_params)

if @user.save
flash[:notice]="User was successfully created"
redirect_to user_path(@user)
else
render :new
end
end



private

def user_params
params.require(:user).permit(:name,:email,:password)
end


end
