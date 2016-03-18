class List < ActiveRecord::Base
  has_many :items

  validates :name, length: {minimum: 3}
end
