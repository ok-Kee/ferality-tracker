class Post < ApplicationRecord

    CATEGORIES = %w(Error Mistake Failure)

    validates :title, :category, :description, :learned, presence: true
    validates :category, inclusion: { in: CATEGORIES}

    scope :failures, -> { where(category: "Failure")}

    # Returns the number of days since the most recent Failure post, or nil if no failures exist.
    def self.days_since_last_failure
      unless failures.exists?
        return nil
      end

      last_failure  = failures.order(created_at: :desc).first

      (Date.current - last_failure.created_at.to_date).to_i

    end

end
