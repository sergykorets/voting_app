class AddErrorMessageToNotificationReceivers < ActiveRecord::Migration
	def change
		add_column :notification_receivers, :error_message, :string
		add_column :notifications, :receivers_count, :integer
		add_column :notifications, :sent_count, :integer
	end
end
