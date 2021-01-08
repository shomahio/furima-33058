require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @user1 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,user_id: @user1.id)
    @user2 = FactoryBot.create(:user)
    @order = FactoryBot.build(:order_address,user_id: @user2.id,item_id: @item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context "商品を購入できる場合" do
      it "全ての項目があれば購入できる" do
        expect(@order).to be_valid
      end
      it "buildingは空でも保存できること" do
        @order.building = ""
        expect(@order).to be_valid
      end
    end
    context "商品が購入できない場合" do
      it "tokenが空では購入できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("カード情報を入力してください")
      end
      it "user_idが空では購入できない" do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it "item_idが空では購入できない" do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
      it "postal_codeが空だと保存できないこと" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "postal_codeがハイフンを含んだ正しい形式でないと保存できないこと" do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号にハイフンを含めてください")
      end
      it "postal_codeが全角では保存できないこと" do
        @order.postal_code = "１２３−４５６７"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号にハイフンを含めてください")
      end
      it "prefectureを選択していないと保存できないこと" do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it "prefectureが1では登録できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it "municipalitiesは空では保存できないこと" do
        @order.municipalities = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("市町村を入力してください")
      end
      it "addressが空では保存できないこと" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it "telが空では保存できないこと" do
        @order.tel = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "telがハイフンがあっては保存できないこと" do
        @order.tel = "090-1234-789"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "telが12桁以上では保存できないこと" do
        @order.tel = "0901234567899"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "telが英数混合では登録できないことでは保存できないこと" do
        @order.tel = "0901234567a"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
