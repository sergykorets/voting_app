class VotingsController < RestrictedController

	before_action :set_election
	before_action :set_voter
	before_action :set_voting

	def new

	end

	def create
		
		# Next step or save
		if @voting.valid?
			if params[:back_button]
				@voting.previous_step
			elsif @voting.last_step?
				if @voting.all_valid?
					@voting.save
				end
			else
				@voting.next_step
			end
			save_step_to_session(@voting.current_step)
		end

		# Render form or redirect
		if @voting.new_record?
			render "new"
		else
			session.delete(session_key)
			redirect_to main_app.root_path, notice: "Thank you for voting!"
		end

	end

protected

	# *********************************************************************
	# Session
	# *********************************************************************

	def session_key
		return "voting"
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


	def set_voting

		@voting = Voting.new(@election, @voter)
		@voting.current_step = load_step_from_session

		current_params = load_params_from_session
		if params[:candidate_ids] 
			current_params[@voting.current_step] = params[:candidate_ids]
		else
			current_params[@voting.current_step] = []
		end
		save_params_to_session(current_params)

		current_params.each do |step, candidate_ids|
			@voting.candidate_ids[step] = candidate_ids.map{ |candidate_id| candidate_id.to_i }
		end

	end

end
