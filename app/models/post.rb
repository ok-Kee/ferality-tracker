class Post < ApplicationRecord

    CATEGORIES = %w(Error Mistake Failure)

    validates :title, :category, :description, :learned, presence: true
    validates :category, inclusion: { in: CATEGORIES}

    scope :failures, -> { where(category: "Failure")}

    def self.days_since_last_failure
      unless failures.exists?
        return days_since_last_failure = "No Failures Yet"

      end

      last_failure_date  = failures.last.created_at.to_date

      days_since_last_failure = Date.current - last_failure_date

      days_since_last_failure.to_i


    end

end
