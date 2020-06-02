require 'rails_helper'

describe Item do
  describe '#create' do

    it "description がない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price,]).to include("を入力してください")
    end

  end
end