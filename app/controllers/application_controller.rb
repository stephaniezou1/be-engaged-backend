class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

end
