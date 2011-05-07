module ApplicationHelper

    def render_flash
    case
    when flash[:notice]
      klass, message = "notice", flash[:notice]
    when flash[:warning]
      klass, message = "warning", flash[:warning]
    when flash[:error]
      klass, message = "error", flash[:error]
    else
      return
    end

    content_tag('div',
      content_tag('h2', message,
    :class => klass), :id => 'flash')
    end

end
