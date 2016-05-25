class List < ActiveRecord::Base
  has_many :items, dependent: :destroy

  validates :name, length: {minimum: 3}
  validates :name, uniqueness: true
end
