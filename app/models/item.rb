class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, length: {minimum: 5}
end
