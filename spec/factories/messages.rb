FactoryGirl.define do
  factory :message do
    text "MyText"
    user
    dialect
  end
end
