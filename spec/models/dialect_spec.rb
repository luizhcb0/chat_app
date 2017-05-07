require 'rails_helper'

RSpec.describe Dialect, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:front_name) }
  end
  
  describe "Associations" do
    it { should have_many(:users) }  
  end
end
