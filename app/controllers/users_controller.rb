class UsersController < ApplicationController
	before_action :current_user, only: [:show, :edit, :update, :destroy]

	def index
		 @users = User.all
	end

	def show
		

		@posts = current_user.posts

	end

	
	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: 'User was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private	
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:name, :image, :post)
	end

end
