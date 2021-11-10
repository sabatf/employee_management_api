class Employee < ApplicationRecord

  validates_presence_of :name, :last_name
end
