FactoryBot.define do
  factory :item do
    name                  {'家'}
    introduction          {'家'}
    category_id           {2}
    condition_id          {2}
    ship_cost_id          {2}
    prefecture_code_id    {2}
    ship_date_id          {2}
    price                 {3000}

    # テーブルを作るものはアソシエーションを記載する。
    association :user

    #Active Storageのテスト用のダミー画像（ afterメソッド）
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
