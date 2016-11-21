module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = APP_CONFIG['default_title']
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current glyphicon glyphicon-triangle-" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    unless css_class.nil?
      css_class += "bottom" if direction == "desc"
      css_class += "top" if direction == "asc"
    end
    link_to title, {:sort => column, :direction => direction, :page => nil}, {:class => css_class}
  end

  def author?(task = @task)
    task.user == current_user
  end
end
