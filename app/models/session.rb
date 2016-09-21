class Session < ActiveRecord::Base
  belongs_to :user

  def is_valid?
    self.created_at.to_i + self.ttl > Time.now.to_i
  end
end
