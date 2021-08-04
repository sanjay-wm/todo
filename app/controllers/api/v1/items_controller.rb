class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def create
    @item = Item.new(allow_params)
    if @item.save
      render json: @item, status: 200
    else
      render json: { errors: @item.errors }, status: 422
    end
  end

  def index
    @items = Item.all
    render json: { items: @items}, status: 200
  end

  def show
    render json: @item, status: 200
  end

  def update
    @item.update(allow_params)
    render json: @item, status: 200
  end

  public
  def allow_params
    params.permit(:title, :status, :created_at)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
