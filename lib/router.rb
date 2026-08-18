# frozen_string_literal: true

class Router
  attr_reader :config, :environment

  def initialize(config, environment)
    @config = config
    @environment = environment
  end

  def call
    controller, action = matched_route || default_route
    controller.new.send(action)
  end

  private

  def routes
    config.routes
  end

  def default_route
    config.no_route
  end

  def matched_route
    routes[path]
  end

  def path
    environment['PATH_INFO']
  end
end
