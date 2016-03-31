class RemoveAndAddColumnsFromUsersRoles < ActiveRecord::Migration
  def change
    remove_column :users_roles, :roles_id, :integer
    remove_column :users_roles, :users_id, :integer

    add_reference :users_roles, :roles, index: true
    add_reference :users_roles, :users, index: true
  end
end
