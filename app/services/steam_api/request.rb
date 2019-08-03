require 'json'

module SteamAPI
  class Request
    class << self
      def get_json(root_path, query = {})
        query_string = query.map{ |k, v| "#{k}=#{v}" }.join("&")
        path = query.empty? ? root_path : "#{root_path}?#{query_string}"
        response = api.get(path)
        body, status = JSON.parse(response.body), response.status
        status == 200 ? body : errors(body)
      end

      def errors(body)
        error = { errors: { status: body['status'], message: body['message'] } }
        body.merge(error)
      end

      def api
        SteamAPI::Connection.api
      end
    end
  end
end
