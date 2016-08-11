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
	resources :election_parts
	resources :candidate_participations
	resources :candidates
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

		resources :election_parts do 
			collection do
					post "filter"
					get "search"
			end
		end
		resources :candidate_participations do 
			collection do
					post "filter"
					get "search"
			end
		end
		resources :candidates do 
			collection do
					post "filter"
					get "search"
			end
		end
	end



end
