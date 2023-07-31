class User < ApplicationRecord
    has_secure_password
    has_many :posts, foreign_key: "author_id"

    def name
        if first_name == nil
            last_name
        elsif last_name == nil
            first_name
        else
            first_name + ' ' + last_name
        end
    end
end
