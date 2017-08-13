class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    render json: {to: 'do'}
  end

  def update
    render json: {to: 'do'}
  end

  def destroy
    render json: User.find(params['id']).destroy
  end
end
