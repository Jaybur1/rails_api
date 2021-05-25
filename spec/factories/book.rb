require 'factory_bot_rails'
FactoryBot.define do
	factory :book do
		trait :book1 do
			author_id {1}
			title {'Summer Camp at Azkaban'}
		end
		trait :book2 do
			author_id {2}
			title {'A Story of the Noseless Persone'}
		end
	end
end