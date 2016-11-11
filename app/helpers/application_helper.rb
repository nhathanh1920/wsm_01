module ApplicationHelper
  def increase_user index, users
    index + (users.current_page - Settings.each_user)*
      Settings.users_paginates + Settings.each_user
  end

  def full_title page_title = ""
    base_title = t "title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def increase_index objects, index
    index + (objects.current_page - Settings.each_index) *
      Settings.pagination.size + Settings.each_index
  end
end
