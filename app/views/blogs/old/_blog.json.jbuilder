json.extract! blog, :id, :title, :body, :status, :topic_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
