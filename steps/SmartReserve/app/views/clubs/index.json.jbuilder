json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :description, :avatar_url, :average_price
  json.url club_url(club, format: :json)
end
