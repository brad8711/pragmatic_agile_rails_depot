module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display: none'
    end
      #content tag helper is used to wrap the output generate by the block in a tag
      content_tag("div", attributes, &block)
  end

end
