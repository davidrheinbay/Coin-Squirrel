class ErrorsController < ApplicationController
  skip_after_action :verify_authorized

  def error404
    render status: 404
  end

  def internal_error
    render status: 500
  end
end
