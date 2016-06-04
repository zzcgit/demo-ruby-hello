require "sinatra"

class HelloWorld < Sinatra::Base
  configure do
    mime_type :text, 'text/plain'
  end

  get "/" do
    send_file  './public/index.html'
  end

  get "/env" do
    content_type :text

    html = ""
    html << "System Environment:\n\n"
    ENV.each do |key, value|
        html << "#{key}: #{value}\n"
    end
    html
  end
end
