FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Name.initials }
    introduction { Faker::Lorem.sentence }
    category_id { '2' }
    condition_id { '2' }
    fee_id { '2' }
    prefecture_id { '2' }
    delivery_time_id { '2' }
    price { '999' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
