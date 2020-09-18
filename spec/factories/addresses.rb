FactoryBot.define do
  factory :address do
    post_code         { 123 - 456 }
    # phone_number      {09012345678}
    prefecture_id     { 2 }
    city              { 北海道 }
    house_number      { 青山 1 - 1 - 1 }
  end
end
