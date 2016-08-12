# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Permission policy form admin
# *
# * Author: Matěj Outlý
# * Date  : 12. 7. 2016
# *
# *****************************************************************************

class AdminPolicy < Struct.new(:user, :admin)
	
	def show?
		return !user.nil? && (user.role == "admin")
	end

end