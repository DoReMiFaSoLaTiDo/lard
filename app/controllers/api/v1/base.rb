module API
  module V1
    class Base < Grape::API
      mount API::users
      #mount API::Another_Resource
    end
  end
end
