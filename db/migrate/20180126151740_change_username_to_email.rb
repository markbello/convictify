class ChangeUsernamelToEmail < ActiveRecord::Migration[5.1]
  def change
    change_table :guards do |t|
      t.rename :username, :email
    end
  end
end
