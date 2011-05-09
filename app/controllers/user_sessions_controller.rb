class UserSessionsController < ApplicationController
#  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_no_user, :only => :new
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => {:warning => "No need to call this for xml messages"} }
      format.json  { render :json => {:warning => "No need to call this for json messages"} }
    end

  end
  
def create
    if current_user
      if current_user_session.associatable_with_facebook_connect?
        if current_user_session.associate_with_facebook_connect
          flash[:notice] = "Your account is now associated with your facebook account"
          redirect_to root_url
        end
      else
        flash[:notice] = "Your facebook account is already connected"
        redirect_to profile_url
      end
    else
      @user_session = UserSession.new(params[:profile_session])
      if @user_session.save
        flash[:notice] = "Login successful!"
        @user_session.user.reset_single_access_token!

        respond_to do |format|
          format.html { redirect_back_or_default account_url } # new.html.erb
          format.xml  { render :xml => {:info => "Logged in ok", :user => @user_session.user} }
          format.json { render :json => {:info => "Logged in ok", :user => @user_session.user} }
        end
      else
        if @user_session.errors.on(:facebook)
          flash[:notice] = "An account already exists with this email, please login to connect it with your Facebook account."
          redirect_to login_path
        else
          flash[:notice] = "Could not login."
          respond_to do |format|
            format.html { render :action => :new } # new.html.erb
            format.xml  { render :xml => {:error => "Failed to login"} }
            format.json  { render :json => {:warning => "Failed to login"} }
          end
        end
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    current_user.reset_single_access_token!
    redirect_back_or_default new_user_session_url
  end
end

