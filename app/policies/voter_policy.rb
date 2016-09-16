
# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Permission policy form voter
# *
# * Author: Matěj Outlý
# * Date  : 12. 7. 2016
# *
# *****************************************************************************

class VoterPolicy < Struct.new(:user, :voter)
	
	def show?
		return !user.nil? && (user.role == "voter" || user.role == "admin")
	end

end