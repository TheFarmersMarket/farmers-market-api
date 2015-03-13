class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :profile_type, inclusion: {:in => ["customer", "farmer"] },
    presence: true
  after_create :create_profile!
  before_save :ensure_authentication_token

  has_one :farmer
  has_one :customer

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def as_json(opts={})
    options = {:only => [:email, :id, :authentication_token, :profile_type]}
    options.merge!(opts)
    super(options)
  end

  private
  def create_profile!
    if self.profile_type == "customer"
      profile = Customer.new
      profile.save(validate: false)
      self.customer = profile
    elsif self.profile_type == "farmer"
      profile = Farmer.new
      profile.save(validate: false)
      self.farmer = profile
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end

