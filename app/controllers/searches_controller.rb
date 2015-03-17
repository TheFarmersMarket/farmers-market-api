class SearchesController < ApplicationController
  before_action :authenticate_user_from_token!

  def search
    if params[:query]
      @search = PgSearch.multisearch(params[:query])
      render json: { search: @search }
    else
      render json: { message: "Non searchable query" }
    end
  end
end