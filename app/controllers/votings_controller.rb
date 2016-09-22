# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Votings
# *
# * Author: Matěj Outlý
# * Date  : 21. 9. 2016
# *
# *****************************************************************************

class VotingsController < PublicController

	before_action :set_election
	#before_action :check_election_votability
	before_action :set_voting

	def new
	end

	def create
		if params[:back_button]
			@voting.previous_step
			save_step_to_session(@voting.current_step)
			redirect_to main_app.new_voting_path
		else
			if @voting.valid?
				if @voting.last_step?
					if @voting.all_valid?
						@voting.save
					end
				else
					@voting.next_step
				end
				save_step_to_session(@voting.current_step)
				if @voting.new_record? # Render form or redirect
					redirect_to main_app.new_voting_path
				else
					clear_session
					redirect_to main_app.root_path, notice: I18n.t("activerecord.notices.models.voting.create")
				end
			else
				render "new"
			end
		end
	end

protected

	# *********************************************************************
	# Session
	# *********************************************************************

	def session_key
		return "voting"
	end

	def clear_session
		session.delete(session_key)
	end

	def save_params_to_session(params)
		session[session_key] = {} if session[session_key].nil?
		session[session_key]["params"] = params if !params.nil?
	end

	def load_params_from_session
		if !session[session_key].nil? && !session[session_key]["params"].nil?
			return session[session_key]["params"]
		else
			return {}
		end
	end

	def save_step_to_session(step)
		session[session_key] = {} if session[session_key].nil?
		session[session_key]["step"] = step if !step.nil?
	end

	def load_step_from_session
		if !session[session_key].nil? && !session[session_key]["step"].nil?
			return session[session_key]["step"]
		else
			return nil
		end
	end

	# *********************************************************************
	# Model setters
	# *********************************************************************

	def set_voting

		# Clear session if requested
		if params[:clear].to_s == "1"
			clear_session
		end

		# Create object
		@voting = Voting.new(@election)
		@voting.current_step = load_step_from_session

		# Load updated data about last filled step and add it to session storing all previously filled steps
		current_params = load_params_from_session
		current_params["steps"] = {} if current_params["steps"].nil?
		if action_name == "create"
			if voting_params[:candidate_ids] 
				current_params["steps"][@voting.current_step] = voting_params[:candidate_ids]
			else
				current_params["steps"][@voting.current_step] = []
			end
			current_params["code"] = voting_params[:code] if !voting_params[:code].nil?
			save_params_to_session(current_params)
		end

		# Set all known data to model
		current_params["steps"].each do |step, candidate_ids|
			@voting.candidate_ids[step] = candidate_ids.map{ |candidate_id| candidate_id.to_i }
		end
		@voting.code = current_params["code"]

	end

	def voting_params
		if params[:voting]
			return params[:voting]
		else
			return {}
		end
	end

	
end
