class SearchesController < ApplicationController
  before_action :authenticate_user_from_token!

  def search
    if params[:query]
      @results = PgSearch.multisearch(params[:query])
      @results = @results.paginate(:page => params[:page], :per_page => 10)
      render "searches/search.json.jbuilder", status: :ok
    else
      render json: { message: "Non searchable query" }, status: :unprocessable_entity
    end
  end
end