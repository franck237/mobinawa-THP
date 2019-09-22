class AddAttributesToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :number, :string
    add_column :admins, :firstname, :string
    add_column :admins, :lastname, :string
    add_column :admins, :function, :string
    add_reference :admins, :country, foreign_key: true
  end
end
