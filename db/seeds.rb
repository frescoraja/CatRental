# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


d1 = Date.new(year = 2003, month = 6, day = 11)
d2 = Date.new(year = 2010, month = 9, day = 9)

Cat.create!(name: "Fluffy", sex: 'F', birth_date: d1, color: "white", description: "A very gregarious cat." )
Cat.create!(name: "Garfield", sex: 'M', birth_date: d2, color: "orange", description: "He's a fat, lasagna-loving feline." )

sd1 = Date.new(year = 2015, month = 6, day = 11)
ed1 = Date.new(year = 2015, month = 6, day = 22)
sd2 = Date.new(year = 2015, month = 6, day = 15)
ed2 = Date.new(year = 2015, month = 6, day = 25)
sd3 = Date.new(year = 2015, month = 7, day = 15)
ed3 = Date.new(year = 2015, month = 7, day = 25)

CatRentalRequest.create!(cat_id: 1, start_date: sd1, end_date: ed1, status: "PENDING")
CatRentalRequest.create!(cat_id: 1, start_date: sd2, end_date: ed2, status: "PENDING")
CatRentalRequest.create!(cat_id: 3, start_date: sd3, end_date: ed3, status: "PENDING")


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
