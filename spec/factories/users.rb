# /spec/factories/users.rb
FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email "#{name}@foo.com"
        password_digest 'foobar'
    end
end
