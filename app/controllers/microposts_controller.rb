# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :current_user, only: :destroy

  def create
    @microspost = current_user.microposts.build(microspost_params)
    if @microspost.after_save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @microspost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referrer || root_url
  end

  private

  def microspost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
