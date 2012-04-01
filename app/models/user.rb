class User < ActiveRecord::Base
  has_many :listings
  has_and_belongs_to_many :watched_listings, :class_name => "Listing", :foreign_key => "watcher_id", :association_foreign_key => "watched_listing_id"

  attr_accessor :password
  attr_accessible :name, :email, :phone, :password, :password_confirmation

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end



  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6 .. 40  }
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false }



end
