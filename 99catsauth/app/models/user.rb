class User < ActiveRecord::Base
  validates password: length: { minimum: 6, allow_nil: true }
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  after_initialize :ensure_session_token

  attr_reader :password

  def ensure_session_token
    session[:session_token] ||= User.generate_random_token
  end

  def self.generate_random_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_name, password)

  end

  def reset_session_token!
    self.session_token = User.generate_random_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
