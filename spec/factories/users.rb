FactoryBot.define do
  factory :user do
    nickname              { 'ひろまし' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) +"1a"}
    password_confirmation { password }
    first_name            { '山瓜' }
    last_name             { '浩' }
    first_name_kana       { 'ヤマウリ' }
    last_name_kana        { 'ヒロシ' }
    date_of_birth         { Date.today }
  end
end
# テーブルを作るものはアソシエーションを記載する。
