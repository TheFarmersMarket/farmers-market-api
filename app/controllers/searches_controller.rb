class SearchesController < ApplicationController
  before_action :authenticate_user_from_token!

  def search
    if params[:query]
      @results = PgSearch.multisearch(params[:query])
      render "searches/search.json.jbuilder", status: :ok
    else
      render json: { message: "Non searchable query" }
    end
  end
end