class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


with_options presence: true do
  validates :name, {length: {maximum: 40}}
  validates :explain, {length: {maximum: 1000}}
  validates :category_id, numericality: {other_than: 1, message: "Select" }
  validates :status_id, numericality: {other_than: 1, message: "of Sales Select"}
  validates :method_of_payment_id, numericality: {other_than: 1, message: "Select"}
  validates :area_id, numericality: {other_than: 1, message: "Select"}
  validates :day_required_id , numericality: {other_than: 1, message: "Select"}
  validates :price, numericality: {with: /\A[0-9]+\z/, message: "Half-width number"}
  validates :image
end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}


  belongs_to :user
  #has_one :purchase_record
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :method_of_payment
  belongs_to :area
  belongs_to :day_required
end
