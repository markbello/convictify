class AddAuthToGuard < ActiveRecord::Migration[5.1]
  def change
    add_column :guards, :email, :string
    add_column :guards, :password_digest, :string
  end
end
