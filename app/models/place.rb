class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
  validates :address, presence: true, length: { maximum: 140, minimum: 3 }
  validates :description, presence: true, length: { maximum: 140, minimum: 3 }

  def self.search(query)
    where("lower(address) LIKE ?", "%#{query.downcase}%")
  end
end
