class UserSession < Authlogic::Session::Base
    # configuration here, see documentation for sub modules of Authlogic::Session

  self.single_access_allowed_request_types = :all

end
