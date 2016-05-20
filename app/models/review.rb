class Review < ActiveRecord::Base
  belongs_to :beer

  def transaction_date
    created_at.strftime("%B %d, %Y")
  end
end

