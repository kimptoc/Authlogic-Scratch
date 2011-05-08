class User < ActiveRecord::Base

      acts_as_authentic do |config|
        config.validate_email_field    = false
        config.change_single_access_token_with_password = true
      end # block optional

end
