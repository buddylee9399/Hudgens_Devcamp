json.extract! portfolio, :id, :title, :subtitle, :body, :position, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
