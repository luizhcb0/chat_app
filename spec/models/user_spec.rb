require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:username) }
  end
  
  describe "Associations" do
    it { should have_many(:messages) }
    it { should belong_to(:dialect) }  
  end
  
end
