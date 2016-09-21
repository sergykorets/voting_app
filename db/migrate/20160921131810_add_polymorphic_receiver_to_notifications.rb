class AddPolymorphicReceiverToNotifications < ActiveRecord::Migration
	def change
		remove_column :notification_receivers, :user_id
		add_column :notification_receivers, :receiver_id, :integer, index: true
		add_column :notification_receivers, :receiver_type, :string, index: true
	end
end
