FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.unique.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_sei {"山田"}
    name_mei {"太郎"}
    kana_sei {"ヤマダ"}
    kana_mei {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end