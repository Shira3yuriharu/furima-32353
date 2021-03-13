class UserPurchase
  include ActiveModel::Model
  # 下記attr_accessorは誰が、いつ、どの商品を購入したかも記録できるようにする？
  attr_accessor :purchase_record, :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly. And also need hyphen(-)." }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    # validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "can't be blank." }
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ , message: "input only number.  And also within 11 digits." }
    validates :user_id
    validates :item_id
    validates :token
  end
    
  def save
    purchaserecord = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchaserecord.id)
  end
end