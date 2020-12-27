FactoryBot.define do
  factory :item do
    image                   {Faker::Lorem.sentence}
    name                    {"たろたろ"}
    explanation             {"あああああ"}
    category_id             {2}
    prefecture_id           {2}
    charge_id               {2}
    shipping_place_id       {2}
    shipping_day_id         {2}
    price                   {1000}
    association :user
  end
end
