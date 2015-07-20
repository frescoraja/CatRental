class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: %w{M F} }
  validates :color, inclusion: { in: %w{black white brown yellow orange} }

  has_many :cat_rental_requests
  
  def age
    Integer(  (Date.today - birth_date) / 365)
  end
end
