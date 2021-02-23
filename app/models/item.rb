class Item < ApplicationRecord


with_options presence: true do
  validates :name, {length: {maximum: 40}}
  validates :explain, {length: {maximum: 1000}}
  validates :category_id
  validates :status_id
  validates :method_of_payment_id  
  validates :area_id
  validates :days_required_id 
  validates :price, format: { with: /\A[0-9]+\z/},inclusion: {in: 300..9999999 }
  #validates :image, presence: true
end

  belongs_to :user
  #has_one :purchase_record
  #has_one_attached :image

end
