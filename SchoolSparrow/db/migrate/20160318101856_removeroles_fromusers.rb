class RemoverolesFromusers < ActiveRecord::Migration
  def change
    remove_column :users, :roles, :string
  end
end
