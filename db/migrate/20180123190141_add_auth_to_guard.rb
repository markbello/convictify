class AddAuthToGuard < ActiveRecord::Migration[5.1]
  def change
    add_column :guards, :username, :string
    add_column :guards, :password_digest, :string
  end
end
