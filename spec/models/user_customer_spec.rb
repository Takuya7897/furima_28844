require 'rails_helper'
RSpec.describe UserCustomer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_customer = FactoryBot.build(:user_customer, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it 'post_code, phone_number, prefecture_id, city, house_number,user, item, building_name, tokenが存在すれば登録できる' do
        expect(@user_customer).to be_valid
      end

      it '建物名が空の時でも登録できる' do
        @user_customer.building_name = ''
        expect(@user_customer).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it '- クレジットカード情報がないとき、正しいクレジットカードの情報で無いときは決済できないこと
      ' do
        @user_customer.item_id = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Item can't be blank")
      end

      it '配送先の情報として、郵便番号必須であること' do
        @user_customer.post_code = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Post code can't be blank")
      end

      it '配送先の情報として、都道府県必須であること' do
        @user_customer.prefecture_id = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '配送先の情報として、市区町村必須であること' do
        @user_customer.city = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の情報として、番地必須であること' do
        @user_customer.house_number = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("House number can't be blank")
      end

      it 'token が空の時' do
        @user_customer.token = ''
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号にハイフンがない時' do
        @user_customer.post_code = '1234567'
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include('Post code is invalid')
      end

      it '郵便番号が前が3文字、後ろが4文字でない時' do
        @user_customer.post_code = '1234-567'
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include('Post code is invalid')
      end

      it '電話番号にはハイフンが入っている時' do
        @user_customer.phone_number = '"000-000-00000"'
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は11桁以内ない時' do
        @user_customer.phone_number = '1111111111111111111111'
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'prefecture_idの値がid 1 のとき' do
        @user_customer.prefecture_id = '1'
        @user_customer.valid?
        expect(@user_customer.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end
  end
end
