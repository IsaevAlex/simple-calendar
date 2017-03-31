class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_action :find_user, only: [:edit, :show ]

	def current_user_home
  		redirect_to current_user
	end    
    
    def show
    	@meetings = current_user.meetings.all
    end

    def index
    end

    private

		def find_user
			@user = User.find(params[:id])
			redirect_to(:back) unless @user.id == current_user.id
		end
end
