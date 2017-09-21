class Post < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :helping_users, class_name: "User",join_table:"helping_users", foreign_key: "post_id", dependent: :destroy
  has_one :location
  has_and_belongs_to_many :requirements

end
