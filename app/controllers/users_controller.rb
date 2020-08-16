class UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.create(user_params)
        redirect_to users_path unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
      end
    
    
      private
    
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end
