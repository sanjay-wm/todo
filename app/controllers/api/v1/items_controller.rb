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
    @items = Item.limit(params[:limit]).offset(params[:offset])
    render json: { items: @items}, status: 200
  end

  def show
    render json: @item, status: 200
  end

  def update
    @item.update(allow_params)
    render json: @item, status: 200
  end

  def destroy
    if @item
      @item.destroy
      render json: { message: "Item successfully deleted" }, status: 204
    else
      render json: { errors: "Not found todo item" }
    end
  end

  def restore_removed_item
    @item = Item.unscoped.find(params[:id])
    if @item
      @item.update(deleted_at: nil)
      render json: { message: "Item restored Successfully" }, status: 200
    else
      render json: { errors: "Not found todo item" }
    end
  end

  public
  def allow_params
    params.permit(:title, :status, :created_at)
  end

  def set_item
    @item = Item.find(params[:id])
    if @item.present?
      @item
    else
      render json: { errors: 'No record found!' }, status: 404
    end
  end
end
