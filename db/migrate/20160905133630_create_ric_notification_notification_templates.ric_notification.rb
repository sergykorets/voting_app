# This migration comes from ric_notification (originally 20160509144238)
class CreateRicNotificationNotificationTemplates < ActiveRecord::Migration
	def change
		create_table :notification_templates do |t|

			# Timestamps
			t.timestamps null: true
			
			# Identification
			t.string :key
			t.string :description

			# Message
			t.string :subject 
			t.text :message
			
		end
	end
end
