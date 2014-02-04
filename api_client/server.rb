require "sinatra"
require "json"

get "/" do
  {"key" => "value"}.to_json
end
