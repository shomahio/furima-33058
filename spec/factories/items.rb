FactoryBot.define do
  factory :item do
    name                    {"あああああ"}
    explanation             {"あああああ"}
    category_id             {2}
    prefecture_id           {2}
    charge_id               {2}
    shipping_place_id       {2}
    shipping_day_id         {2}
    price                   {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
