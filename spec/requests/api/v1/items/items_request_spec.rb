require 'rails_helper'

describe 'Items API' do
  context '/api/v1/items/top_revenue?quantity=x' do
    it 'returns top ranked item' do
      merchant  = create(:merchant)
      item1     = create(:item, merchant_id: merchant.id)
      item2     = create(:item, merchant_id: merchant.id)
      item3     = create(:item, merchant_id: merchant.id)
      inv1      = create(:invoice)
      inv2      = create(:invoice)
      inv3      = create(:invoice)
      trans1    = create(:transaction, invoice_id: inv1.id, result: 'success')
      trans2    = create(:transaction, invoice_id: inv2.id, result: 'success')
      trans3    = create(:transaction, invoice_id: inv3.id, result: 'success')
      inv_item1 = create(:invoice_item, invoice_id: inv1.id, quantity: 30, unit_price: 40)
      inv_item2 = create(:invoice_item, invoice_id: inv1.id, quantity: 20, unit_price: 30)
      inv_item3 = create(:invoice_item, invoice_id: inv1.id, quantity: 10, unit_price: 20)


      get '/api/v1/items/most_revenue?quantity=2'
      top_items = JSON.parse(response.body)

      expect(top_items.first['id']).to eq(4)

    end
  end
end