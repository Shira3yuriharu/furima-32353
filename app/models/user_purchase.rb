class UserPurchase
  include ActiveModel::Model
  # 下記attr_accessorは誰が、いつ、どの商品を購入したかも記録できるようにする？
  attr_accessor :purchase_record, :post_code, :area_id, :city, :address, :building_name, :phone_number, :user, :item

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "can't be blank." }
    validates :address
    validates :phone_number, format: { with: \d{0,11}?, message: "Input only number." }
  end
  
  def save
  
  end
end