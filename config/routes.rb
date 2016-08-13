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

		root "dashboard#index"

		resources :election_parts, only: [] do 
			collection do
				get "search"
			end
		end

		resources :candidates do 
			collection do
				post "filter"
				get "search"
			end
			resources :candidate_participations, except: [:index]
		end

		resources :elections do 
			collection do
				post "filter"
				get "search"
			end
			resources :election_parts, except: [:index] do
				resources :candidate_participations, only: [] do
					member do
						put "move/:relation/:destination_id", action: "move", as: "move"
					end
				end
			end
		end
				
	end

end
