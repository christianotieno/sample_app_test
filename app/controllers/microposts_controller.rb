# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    @microspost = current_user.microposts.build(microspost_params)
    if @microspost.after_save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy; end

  private

  def microspost_params
    params.require(:micropost).permit(:content)
  end
end
