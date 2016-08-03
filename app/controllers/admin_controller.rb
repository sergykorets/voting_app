# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Abstract engine controller
# *
# * Author: Matěj Outlý
# * Date  : 5. 5. 2015
# *
# *****************************************************************************

class AdminController < ApplicationController

	#**************************************************************************
	# Layout
	#**************************************************************************

	#
	# Layout
	#
	layout "ric_admin"

	#
	# Title component
	#
	component RicAdmin::TitleComponent

	#
	# Header logo component
	#
	component RicAdmin::HeaderLogoComponent

	#
	# Header menu component
	#
	component RicAdmin::HeaderMenuComponent
	
	#
	# Footer menu component
	#
	component RicAdmin::FooterMenuComponent

	#
	# Footer copy component
	#
	component RicAdmin::FooterCopyComponent

end
