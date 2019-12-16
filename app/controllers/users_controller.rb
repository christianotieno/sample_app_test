# frozen_string_literal: true

class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @users = User.new
  end
end
