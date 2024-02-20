FactoryBot.define do
  factory :item do
    name { "Test" }
    study_time { "5000" }
    month { 1 }
    association :user
    association :category
  end
end