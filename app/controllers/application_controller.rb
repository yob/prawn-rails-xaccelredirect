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
    # Set a binary Content-Transfer-Encoding, or ActionController::AbstractResponse#assign_default_content_type_and_charset!
    # will set a charset to the Content-Type header.
    response.headers['Content-Transfer-Encoding'] = 'binary' unless response.headers['Content-Type'].match(/text\/.*/)
    response.headers['Content-Disposition'] = "attachment;"
    if opts[:filename]
      response.headers['Content-Disposition'] = "attachment; filename= \"#{opts[:filename]}\""
    else
      response.headers['Content-Disposition'] = "inline"
    end
    response.headers["X-Accel-Redirect"] = path     # nginx
    response.headers['X-Sendfile'] = path           # Apache and Lighttpd >= 1.5
    response.headers['X-LIGHTTPD-send-file'] = path # Lighttpd 1.4

    Rails.logger.info "#{path} sent to client using X-Accel-Redirect"

    render :nothing => true
  end
end
