# frozen_string_literal: true

class ApplicationController
  private

  def render(view = '', status = 200, headers = {})
    [status, default_headers.merge(headers), render_view(view)]
  end

  def render_view(view)
    Renderer.call(view)
  end

  def default_headers
    { 'content-type' => 'text/html' }
  end
end
