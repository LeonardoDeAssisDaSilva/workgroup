module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      content_tag(:div, render(comment), :class => "replies")
    end.join.html_safe
  end

  def votes(comment)
    (comment.get_upvotes.size - comment.get_downvotes.size).to_s
  end
end
