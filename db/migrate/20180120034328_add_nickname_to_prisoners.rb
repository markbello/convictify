class AddNicknameToPrisoners < ActiveRecord::Migration[5.1]
  def change
    add_column :prisoners, :nickname, :string
  end
end
