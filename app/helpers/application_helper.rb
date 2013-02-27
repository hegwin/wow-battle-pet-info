module ApplicationHelper
  def div_if(condition, attributes = {}, &block)
    if condition
      content_tag("div", attributes, &block)
    end
  end
end
