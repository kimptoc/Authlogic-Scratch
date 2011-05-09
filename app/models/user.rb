class User < ActiveRecord::Base

      acts_as_authentic do |config|
        config.validate_email_field    = false
        config.change_single_access_token_with_password = true
      end # block optional

   def before_connect(facebook_session)
#    self.first_name = facebook_session.first_name
#    self.last_name = facebook_session.last_name
    self.email = facebook_session.email
#    self.username = "#{facebook_session.first_name}.#{facebook_session.last_name}"
#    self.password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.username}--")[0,6]
#    self.password_confirmation = self.password
#    self.active = true
  end
end
