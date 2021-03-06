require 'rails_helper'


RSpec.describe Employee, type: :model do

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
end
