class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :omniauthable
         # :registerable,
         # :recoverable,
         # :validatable,

  def self.find_or_create_by_vkontakte_oauth(access_token)
    User.where(vkid: access_token.uid).first_or_create do |user|
      user.url = access_token.info.urls.Vkontakte
      user.name = access_token.info.name
      user.nickname = access_token.info.nickname
      user.password = Devise.friendly_token[0, 20]
      user.email = "#{access_token.uid}@vk.com"
      user.photo_url = access_token.extra.raw_info.photo_200_orig
    end
  end
end
