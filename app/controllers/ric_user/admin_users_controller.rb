require_dependency "ric_user/admin_controller"

module RicUser
	class AdminUsersController < AdminController
		include RicUser::Concerns::Controllers::Admin::UsersController

	protected

		# 
		# Never trust parameters from the scary internet, only allow the white list through.
		#
		def user_params
			params.require(:user).permit(:email, :role, :name => [:firstname, :lastname])
		end
	end
end