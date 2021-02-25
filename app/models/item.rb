class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


with_options presence: true do
  validates :name, {length: {maximum: 40}}
  validates :explain, {length: {maximum: 1000}}
  validates :category_id, numericality: {other_than: 1}
  validates :status_id, numericality: {other_than: 1}
  validates :method_of_payment_id, numericality: {other_than: 1}
  validates :area_id, numericality: {other_than: 1}
  validates :days_required_id , numericality: {other_than: 1}
  validates :price, format: { with: /\A[0-9]+\z/},inclusion: {in: 300..9999999 }
  validates :image
end

  belongs_to :user
  #has_one :purchase_record
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :method_of_payment
  belongs_to :area
  belongs_to :days_required
end
