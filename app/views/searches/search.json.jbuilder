json.search do
  @results.each do |result|
    json.result_id result.searchable_id
    json.result_type result.searchable_type
    json.result_match result.content
    json.result_url url_for(result.searchable)
  end
end
