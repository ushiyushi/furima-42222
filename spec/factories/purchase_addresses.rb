FactoryBot.define do
  factory :purchase_address do
    post_code { "123-4567" }
    prefecture_id { 1 }
    city { "札幌市" }
    street_address { "1-1" }
    building { "札幌ハイツ" }
    phone { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
