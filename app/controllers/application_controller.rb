# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "default"

  def x_accel_pdf(path, filename)
    x_accel_redirect(path, :type => "application/pdf",
                           :filename => filename)
  end

  def x_accel_redirect(path, opts ={})
    if opts[:type]
      response.headers['Content-Type'] = opts[:type]
    else
      response.headers['Content-Type'] = "application/octet-stream"
    end
    response.headers['Content-Disposition'] = "attachment;"
    if opts[:filename]
      response.headers['Content-Disposition'] << " filename= \"#{opts[:filename]}\""
    end
    response.headers["X-Accel-Redirect"] = path

    Rails.logger.info "#{path} sent to client using X-Accel-Redirect"

    render :nothing => true
  end
end
