PDFKit.configure do |config|
  config.wkhtmltopdf = '/home/shajin/.rvm/gems/ruby-1.9.2-p0/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
end
