class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :status, presence: true
  validates :status, inclusion: { in: %w{PENDING APPROVED DENIED} }
  validate overlapping_approved_requests

  belongs_to :cat
  
  def overlapping_requests

  CatRentalRequest.find_by_sql(<<-SQL)
    SELECT
      crr1.id
    FROM
      cat_rental_requests crr1
    JOIN
      cat_rental_requests crr2 ON crr2.cat_id = crr1.cat_id
    WHERE
      ((crr1.start_date BETWEEN  crr2.start_date AND crr2.end_date) OR
      (crr1.end_date BETWEEN crr2.start_date AND crr2.end_date)) AND crr1.id != crr2.id
    ORDER BY
      crr1.id;
    SQL

  end

  def overlapping_approved_requests

  end
end
