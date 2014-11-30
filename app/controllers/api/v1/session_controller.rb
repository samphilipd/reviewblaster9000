module Api
  module V1
    class SessionController < BaseController
      # Extremely simplistic sessions controller.
      #
      # This offers absolutely no real security but serves to demonstrate the concept
      # of API authentication.
      #
      # A true solution would use a User model and generate a random access key on
      # every login.
      def create
        if params[:username] == 'admin' and params[:password] == 'rbnk'
          render json: { access_token: 12345, token_type: 'bearer'}
        else
          render json: {error: 'Invalid Login Details'}, status: 401
        end
      end
    end
  end
end

