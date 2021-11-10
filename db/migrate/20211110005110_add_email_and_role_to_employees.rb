class AddEmailAndRoleToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :email, :string
    add_column :employees, :role, :string
  end
end
