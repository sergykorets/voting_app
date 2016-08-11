class VoterPolicy < Struct.new(:user, :voter)
	
	def show?
		return !user.nil? && (user.role == "voter" || user.role == "voter")
	end

end