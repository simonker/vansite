class AdminUsersController < ApplicationController
  def index
    @admin_users = AdminUser.sorted
  end

  def login
  end

  def new
    @admin_users = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice]='Admin user created'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end
  def edit
    @admin_user = AdminUser.find(params[:id])
  end
  
  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.save
      flash[:notice]='Admin user Updated'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end
  def delete
    @admin_user = AdminUser.find(params[:id])
  end
  
  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice]="Admin user destroyed."
    redirect_to(:action => 'list')
  end
end
