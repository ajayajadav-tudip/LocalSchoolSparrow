class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :dob, :date
    add_column :profiles, :phonenumber, :integer
    add_column :profiles, :photoupload, :string
    add_column :profiles, :rentvsbuyvsunknown, :string
    add_column :profiles, :whenlookkingfor, :integer
    add_column :profiles, :noofbeds, :integer
    add_column :profiles, :noofbathrooms, :integer
    add_column :profiles, :budget, :integer
    add_column :profiles, :noofchildren, :integer
    add_column :profiles, :agechild, :integer
    add_column :profiles, :decision1, :string
    add_column :profiles, :decision2, :string
    add_column :profiles, :workaddress, :string



  end
end
