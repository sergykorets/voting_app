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

	#
	# Public
	#
	root "homepage#index"
	resources :votings, only: [:new, :create] 
	resources :results	
	
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
		
		resources :voters do
			collection do
				post "import"
				post "filter"
				get "search"
			end
			member do
				put "generate_code"
			end
		end	
				
	end

	#
	# RIC Devise
	#
	mount RicDevise::Engine => "/auth"

	#
	# RIC Admin
	#
	mount RicAdmin::Engine => "/admin"

	#
	# RicAuth
	#
	mount RicAuth::AdminEngine => "/admin", as: :ric_auth_admin

	#
	# RicUser
	#
	mount RicUser::AdminEngine => "/admin", as: :ric_user_admin

	#
	# RIC Notification
	#
	mount RicNotification::AdminEngine => "/admin", as: :ric_notification_admin

end
