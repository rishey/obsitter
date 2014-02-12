class User < ActiveRecord::Base
  has_secure_password
  has_many :blurts
  validates :username, :email,   presence: true
  validates :email, email: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :web_site, url: true
  after_initialize :init

  private
  def init
    if self.new_record? && self.protect_tweets == false
      self.protect_tweets = false
    end
  end

end
