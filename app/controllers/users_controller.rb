class UsersController < ApplicationController
   def new
    @user = User.new             # require for getting the user information
   end

   def create                    # will save the entered informations in database
    @user = User.new(user_params)
     if @user.save
        flash[:success] = "Welcome to AlphaBlog app #{@user.username}" 
        redirect_to articles_path
     else
        render 'new'
     end
    end

    def edit
       @user = User.find(params[:id])       # to edit user first we need to find the user with id
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to articles_path
      else
        render 'edit'
      end
    end
    def show
      @user = User.find(params[:id])  
    end

private
   def user_params               #whitelist the users enterd value
     params.require(:user).permit(:username,:password,:email)
   end
end

