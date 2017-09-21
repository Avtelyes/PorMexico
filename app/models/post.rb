class Post < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :helping_users, class_name: "User",join_table:"helping_users", foreign_key: "post_id", dependent: :destroy
  has_one :location
  has_and_belongs_to_many :requirements

  accepts_nested_attributes_for :location

  before_save :default_values
  def default_values
    self.status ||= 'active' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

end
