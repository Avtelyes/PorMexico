class Post < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :helping_users, class_name: "User",join_table:"helping_users", foreign_key: "post_id", dependent: :destroy
  belongs_to :location
  has_and_belongs_to_many :requirements

  accepts_nested_attributes_for :location

  scope :containing, ->(text){
    self.where(includes_filter(text))
  }

  # Pagination
  self.per_page =3

  before_save :default_values
  def default_values
    self.status ||= 'active' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

  def search_string
    post=self
    reqs = ""
    post.requirements.each do |req|
      reqs = reqs+ req.name
    end
    reqs = reqs + post.content
    reqs = reqs + post.user.name
    reqs
  end

  def includes_filter(text)
    self.search_string.include? text
  end

end
