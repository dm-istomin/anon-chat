class User < ActiveRecord::Base
  has_secure_password

  has_many :messages
  has_many :invitations

  validates :password, confirmation: true
  validates :permanent_name, uniqueness: true
  validates :permanent_name, presence: true

  after_initialize :default

  def default
    self.fixed_identity = false if self.fixed_identity == nil
  end

end
