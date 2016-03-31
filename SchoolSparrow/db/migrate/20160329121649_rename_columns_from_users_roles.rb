class RenameColumnsFromUsersRoles < ActiveRecord::Migration
  def change
    rename_column :users_roles, :users_id, :user_id
    rename_column :users_roles, :roles_id, :role_id
  end
end
