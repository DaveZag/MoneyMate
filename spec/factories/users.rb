FactoryBot.define do
  factory :user do
    name { 'Dave' }
    email { "user#{rand(1000)}@test.com" }
    password { 'password' }
  end
end
