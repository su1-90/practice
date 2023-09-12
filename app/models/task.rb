class Task < ApplicationRecord
    belongs_to :user

    def self.user_id_from_name(username)
        user = User.find_by(name: username)
        user&.id
    end
end
