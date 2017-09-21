class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_and_belongs_to_many :helping_posts, class_name: "Post",join_table:"helping_users", foreign_key: "user_id", dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts "USER"
      puts auth
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.location = auth.location
      user.fb_profile= "www.facebook.com/" + auth.uid
      user.save
    end
  end


end