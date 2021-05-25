FactoryBot.define do
  factory :author do
    trait :tom do
      first_name { "Tom" }
      last_name { "The Cat" }
      age { 122 }
    end

    trait :jerry do
      first_name { "Jerry" }
      last_name { "The Mouse" }
      age { 120 }
    end
  end
end
