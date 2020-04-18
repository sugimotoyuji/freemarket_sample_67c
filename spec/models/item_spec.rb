require 'rails_helper'
describe Item do
  describe '#create' do
    it "descriptionがない場合は登録できないこと" do
     item = Item.new(name: "a", user_id: "1", description: "", category_id:"1",size_id:"1", condition_id:"1", delivery_charge_id:"1",delivery_way_id:"1",delivery_date_id:"1",price:"300")
     item.valid?
     expect(item.errors[:description]).to include("can't be blank")
    end
  end
end