class User < ApplicationRecord
  #email, password_digest, session_token
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true
  #ensures session token
  after_initialize :ensure_session_token

  attr_reader :password
  #generates session_token after initialize of user
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
  #compare password bcrypt to bcrypt of actual password
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  #here password becomes a bcrypt object
  def password=(password)
    @debugger
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
