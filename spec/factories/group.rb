FactoryBot.define do
  factory :group do
    name                      { Faker::Football.team }
    image                     { "def0519bf0833262651636ce2d5705d1.png" }
  end
end
