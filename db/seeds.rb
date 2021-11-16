# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlantingCultureInformation.create_or_find_by({
  name: "Batata",
  days_to_senescence: 10,
  days_to_full_vegetation: 20,
  days_to_harvest_possibility: 30,
})


cars = [
  Car.create_or_find_by({
    name: "Chevetão",
    model_number: "chev-8855",
    year: 1990,
  }),
  Car.create_or_find_by({
    name: "Fuscão",
    model_number: "fsc-9115",
    year: 1993,
  }),
]

car_without_sales = Car.create_or_find_by({
    name: "Corola",
    model_number: "crl-1548",
    year: 2015,
  })

countries = [
  Country.create_or_find_by({
    name: "Brazil",
    population: 200_000_000
  }),
  Country.create_or_find_by({
    name: "Germany",
    population: 30_000_000
  }),
]

cars.each do |car|
  countries.each do |country|
    CarsSale.create_or_find_by({
      car_id: car.id,
      total_sales: 1000,
      country_id: country.id,
      year: 1991,
    })
  end
end

cars_with_sales_in_brazil = Car.joins(:countries).where(countries: {name: 'Brazil'}).select(:id)

<<-SQL
SELECT "cars"."id" FROM "cars"
INNER JOIN "cars_sales" ON "cars_sales"."car_id" = "cars"."id"
INNER JOIN "countries" ON "countries"."id" = "cars_sales"."country_id"
WHERE "countries"."name" = 'Brazil'
SQL

cars_with_sales_in_brazil = Car.joins(:countries).where(countries: {name: 'Brazil'}).select(:id)
Car.where.not(id: cars_with_sales_in_brazil)

<<-SQL
SELECT "cars".* FROM "cars"
WHERE "cars"."id" NOT IN (
  SELECT "cars"."id" FROM "cars"
  INNER JOIN "cars_sales" ON "cars_sales"."car_id" = "cars"."id"
  INNER JOIN "countries" ON "countries"."id" = "cars_sales"."country_id"
  WHERE "countries"."name" = 'Brazil'
)
SQL

# construindo queries na mão uma vez!
Car.joins("INNER JOIN cars_sales cs ON cs.car_id = cars.id").where(cs: {id: '74005720-b1ce-4ade-8db2-2a18d465cccf'})
