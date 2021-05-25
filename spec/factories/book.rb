require 'factory_bot_rails'
FactoryBot.define do
	factory :book do
		trait :book1 do
			author {'Tom Riddle'}
			title {'Summer Camp at Azkaban'}
		end
		trait :book2 do
			author {'Tom Marvello Riddle'}
			title {'A Story of the Noseless Persone'}
		end
	end
end