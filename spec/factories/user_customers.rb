FactoryBot.define do
  factory :user_customer do
    post_code         { '123-4567' }
    phone_number      { '00000000000' }
    prefecture_id     { 2 }
    city              { '横浜' }
    house_number      { '青山 1-1-1' }
    building_name     { '高丸' }
    token             { 'gfsjdghjkg' }
    # テーブルを作るものはアソシエーションを記載する。
    association :user, :item, :address
  end
end
