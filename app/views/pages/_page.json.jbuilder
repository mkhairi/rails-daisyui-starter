json.extract! page, :id, :title, :content, :published, :prefrences, :status, :created_at, :updated_at
json.url page_url(page, format: :json)
