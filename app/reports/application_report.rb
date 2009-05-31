require 'pathname'

class ApplicationReport
  include ERB::Util

  attr_reader :path

  def render
    self.__send__(:render_header) if self.respond_to?(:render_header)
    self.__send__(:render_body)   if self.respond_to?(:render_body)
    self.__send__(:render_footer) if self.respond_to?(:render_footer)
    File.open(tmp_file, "w") { |f| f.write pdf.render }
    self
  end

  private

  def pdf(opts = {})
    @path ||= tmp_file
    @pdf ||= ::Prawn::Document.new(opts)
  end

  # choose a file to render our PDF to before sending it to the user
  def tmp_file
    counter = 1
    path = nil
    dir = RAILS_ROOT + "/tmp/pdfs"
    FileUtils.mkdir_p(dir)
    dir = Pathname.new(dir).realpath
    while path.nil? || File.file?(path)
      path = "#{dir}/pdf-#{counter}"
      counter += 1
    end
    path
  end

end
