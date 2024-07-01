module ApplicationHelper
  def avatar_url
    "https://i.pravatar.cc/500?img=#{(1..70).to_a.sample}"
  end
end
