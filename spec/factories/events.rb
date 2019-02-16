FactoryBot.define do
  factory :event do
    start_time = Date.today.to_time
    user
    group
    name                      { Faker::Esport.event }
    start_time                { start_time }
    end_time                  { start_time }
    place                     { Faker::Address.street_name }
    comment                   { Faker::Lorem.sentence }
  end
end
