module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Informer"
    if page_title.empty?
      base_title # return不要（暗黙の戻り値）
    else
      page_title + " | " + base_title
    end
  end
end
