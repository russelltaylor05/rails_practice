class CollectionsController < ApplicationController
  def new
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def index
    @collections = Collection.all
  end
end
