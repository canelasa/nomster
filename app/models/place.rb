class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
  validates :address, presence: true, length: { maximum: 140, minimum: 3 }
  validates :description, presence: true, length: { maximum: 140, minimum: 3 }
end
