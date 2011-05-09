class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"

      respond_to do |format|
        format.html { redirect_back_or_default account_url } # show.html.erb
        format.xml  { render :xml => @user  }
        format.json  { render :json => @user }
      end
    else

      respond_to do |format|
        format.html { render :action => :new } # show.html.erb
        format.xml  { render :xml => "Error creating user"  }
        format.json  { render :json => "Error creating user" }
      end
    end
  end

  def show
    @user = @current_user

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user  }
      format.json  { render :json => @user }
    end

  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"

      respond_to do |format|
        format.html { redirect_to account_url } # show.html.erb
        format.xml  { render :xml => @user }
        format.json  { render :json => @user }
      end

    else

      respond_to do |format|
        format.html { render :action => :edit } # show.html.erb
        format.xml  { render :xml => "Error saving account" }
        format.json  { render :json => "Error saving account" }
      end
    end
  end

end
