class Review < ActiveRecord::Base
  belongs_to :beer

  def transaction_date
    created_at.strftime("%B %d, %Y")
  end

  def transaction_price
    '$' + price.round(2).to_s
  end
end

