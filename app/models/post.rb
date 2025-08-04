class Post < ApplicationRecord

    validates :title, :category, :description, :learned, presence: true
    validates :category, inclusion: { in: ["Error", "Mistake", "Failure"] }


    def self.current_failure_streak
      streak = 0
      previous = nil

      order(created_at: :desc).each do |post|
        if previous.nil? || (previous.created_at - post.created_at) <= 1.day
          streak += 1
          previous = post
        else
          break
        end
      end

      streak

    end
end
