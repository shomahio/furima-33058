require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が投稿できる場合" do
      it "全ての項目があれば投稿できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が投稿できない場合" do
      it "画像が空では投稿できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では投稿できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では投稿できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが空では投稿できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it "商品の状態が空では投稿できない" do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge_id_id can't be blank")
      end
      it "配送料の負担が空では投稿できない" do
        @item.shipping_place_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_place_id can't be blank")
      end
      it "発送元の地域が空では投稿できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture_id can't be blank")
      end
      it "発送までの日数が空では投稿できない" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_day_id can't be blank")
      end
      it "価格が空では投稿できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が全角では投稿できない" do
        @item.price = "１０００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("半角文字を使用してください")
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
