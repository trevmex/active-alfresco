require 'digest/sha1'
# require 'krb5_auth'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  # include Krb5Auth

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    # 
    # krb5 = Krb5.new
    # begin
    #     is_authenticated = krb5.get_init_creds_password(login, password)
    # rescue Krb5Auth::Krb5::Exception => krb5_exception
    #     is_authenticated = false
    #     logger.error(krb5_exception.message)
    # ensure
    #     krb5.close
    # end
    # 
    # #
    # # If the user does not exist AND they are authenticated to Kerberos
    # # create a new user.
    # #
    # if is_authenticated && !u
    #   u = User.create(:login => login, :password => 'dummypassword', :password_confirmation => 'dummypassword')
    # end
    # 
    u && is_authenticated ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    


end
