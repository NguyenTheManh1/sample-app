class FollowingsController < ApplicationController
  before_action :find_user, only: :index

  def index
    @title = t "following"
    @users = @user.following.paginate page: params[:page],
      per_page: Settings.num_paginate
    render "users/show_follow"
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
