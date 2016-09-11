# This migration comes from ric_notification (originally 20160121093817)
class CreateRicNotificationNotifications < ActiveRecord::Migration
	def change
		create_table :notifications do |t|

			# Timestamps
			t.timestamps null: true

			# Kind
			t.string :kind

			# Message
			t.string :subject
			t.text :message
			t.string :url

			# Author (user)
			t.integer :author_id

		end
	end
end
