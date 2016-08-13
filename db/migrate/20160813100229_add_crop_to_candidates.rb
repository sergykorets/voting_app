class AddCropToCandidates < ActiveRecord::Migration
	def change
		add_column :candidates, :photo_crop_x, :integer
		add_column :candidates, :photo_crop_y, :integer
		add_column :candidates, :photo_crop_w, :integer
		add_column :candidates, :photo_crop_h, :integer
	end
end
