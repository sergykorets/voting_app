# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Routing
# *
# * Author: Matěj Outlý
# * Date  : 11. 6. 2015
# *
# *****************************************************************************

Rails.application.routes.draw do

	# Root
	root "homepage#index"

	#
	# RicDevise
	#
	mount RicDevise::Engine => "/auth"

	#
	# RicAdmin
	#
	mount RicAdmin::Engine => "/admin"

	#
	# RicAccount
	#
	mount RicAccount::Engine => "/admin"

	#
	# RicUser
	#
	mount RicUser::AdminEngine => "/admin/users", as: :ric_user_admin

	#
	# Admin
	#
	namespace :admin do

		# Root
		root "dashboard#index"
		
	end

end
