class AddIsAdminToGuards < ActiveRecord::Migration[5.1]
  def change
    add_column :guards, :is_admin, :boolean, :default => 0
  end
end
