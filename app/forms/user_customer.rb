class UserCustomer
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :customer_id

  # validates
  # 「住所」に関するバリデーション
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, messsgge: 'は「-」も入力してください' }
    validates :phone_number, format: { with: /\A\d{11}\z/, messsgge: 'は「-」なしで入力してください' }
    validates :city
    validates :house_number
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  # 「カードの情報」に関するバリデーション
  validates :item_id, presence: true
  validates :token, presence: true
  # // validates

  # 2つの情報を保存するための記述をしましょう
  def save
    # カードの情報を保存
    customer = Customer.create(user_id: user_id, item_id: item_id)
    # マイグレーションファイルからpriceカラムを削除する
    # 住所の情報を保存
    Address.create(post_code: post_code, city: city, house_number: house_number, phone_number: phone_number, building_name: building_name, prefecture_id: prefecture_id, customer_id: customer.id)
    # １、addressテーブルも編集をする ２、customer_idにする　３、customerのidをaddressテーブルに渡せる状態にする
  end
end
