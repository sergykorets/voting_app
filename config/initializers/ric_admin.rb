RicAdmin.setup do |config|
	
	#
	# Layout
	#
	config.css_layout = "admin"
	config.js_layout = "admin"
	
	#
	# Header
	#
	config.title = "Administrace | CZEPA"
	config.header_logo_url = "main_app.admin_root_path"
	config.header_logo_image = "admin_header_logo.png"
	
	#
	# Footer
	#
	config.client_name = "CZEPA"
	config.client_year = "2010"
	config.client_url = "http://www.czepa.cz"
	config.client_image = "admin_footer_logo_czepa.png"
	config.developer_name = "Anuba Design"
	config.developer_year = "2014"
	config.developer_url = "http://www.anuba.cz"
	config.developer_image = "admin_footer_logo_anuba.png"
	
	#
	# Menu
	#
	config.header_menu = [
		{
			label: "headers.admin.elections.index",
			url: "main_app.admin_elections_path",
			icon: "hand-paper-o",
			active_if: "controller_name == 'elections' || controller_name == 'election_parts'",
		},
		{
			label: "headers.admin.candidates.index",
			url: "main_app.admin_candidates_path",
			icon: "black-tie",
			active_if: "controller_name == 'candidates' || controller_name == 'candidate_participations'",
		},
		{
			label: "headers.admin.voters.index",
			url: "main_app.admin_voters_path",
			icon: "users",
			active_if: "controller_name == 'voters'",
		},
		{
			type: "delimiter",
		},
		{
			label: "headers.ric_user.admin_users.index",
			url: "ric_user_admin.users_path",
			icon: "user-md",
			active_if: "controller_name == 'admin_users'",
		},
		{
			label: "headers.ric_notification.admin_notifications.index",
			url: "ric_notification_admin.notifications_path",
			dropdown: [
				{
					label: "headers.ric_notification.admin_notifications.index",
					url: "ric_notification_admin.notifications_path",
					icon: "comment",
					active_if: "controller_name == 'admin_notifications'",
				},
				{
					label: "headers.ric_notification.admin_notification_templates.index",
					url: "ric_notification_admin.notification_templates_path",
					icon: "cog",
					active_if: "controller_name == 'admin_notification_templates'",
				}
			]
		},
		{
			type: "delimiter",
		},
		{
			label: "headers.web",
			url: "main_app.root_path",
			icon: "globe",
		}	
	]
end