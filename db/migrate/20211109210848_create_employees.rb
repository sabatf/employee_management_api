class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, :null => false
      t.string :last_name, :null => false
      t.string :address
      t.integer :status, :null => false, :default => '1'
      t.datetime :start_date, :default => DateTime.now
      t.datetime :end_date

      t.timestamps
    end
  end
end
