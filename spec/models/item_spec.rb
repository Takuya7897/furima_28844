require 'rails_helper'
describe Item do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it 'name, price, introduction, category_id, condition_id,  ship_cost_id,  ship_date_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it '画像は1枚ないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないとき' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないとき' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの情報がないとき' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報がないとき' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報がないとき' do
        @item.ship_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
      it '発送元の地域についての情報がないとき' do
        @item.prefecture_code_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
      end

      it '発送までの日数についての情報がないとき' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end

      it '価格についての情報がないとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格の範囲が、¥300~¥9,999,999の間ではないとき' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '販売価格は半角数字のみ入力可能ではないとき' do
        @item.price = '数字'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'category_id,の値がid 1 のとき保存されない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idの値がid 1 のとき保存されない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'prefecture_code_idの値がid 1 のとき保存されない' do
        @item.prefecture_code_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture code must be other than 1')
      end

      it 'ship_cost_idの値がid 1 のとき保存されない' do
        @item.ship_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship cost must be other than 1')
      end
      it 'ship_date_idの値がid 1 のとき保存されない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end
    end
  end
end
