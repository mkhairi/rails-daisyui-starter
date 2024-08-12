module ApplicationHelper
  def container_class
    if controller_name == "pages" && action_name == "welcome"
      "container-full"
    else
      "container"
    end
  end

  def avatar_url
    "https://i.pravatar.cc/500?img=#{(1..70).to_a.sample}"
  end
end
