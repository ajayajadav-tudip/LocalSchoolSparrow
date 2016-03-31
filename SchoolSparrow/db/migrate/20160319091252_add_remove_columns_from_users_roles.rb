class AddRemoveColumnsFromUsersRoles < ActiveRecord::Migration
  def change
    remove_column :users_roles, :user_id, :integer
    remove_column :users_roles, :role_id, :integer

    add_reference :users_roles, :roles, index: true
    add_reference :users_roles, :users, index: true
  end
end
