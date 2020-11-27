FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    family_name           { person.last.kanji }
    family_name_furigana  { person.last.katakana }
    first_name_furigana   { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
