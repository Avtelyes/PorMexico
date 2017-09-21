class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts "USER"
      puts auth
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.email
      user.location = auth.location
      user.fb_profile= auth.link
      user.save
    end
  end


end