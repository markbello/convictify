class RemoveIsAdminFromGuards < ActiveRecord::Migration[5.1]
  def change
    remove_column :guards, :is_admin, :boolean
  end
end
