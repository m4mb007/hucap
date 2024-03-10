# Clear existing data
Participant.destroy_all
CourseCategory.destroy_all


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cat_data = [
    {name: 'Category A'},
    {name: 'Category B'},
]

cat_data.each do |category|
CourseCategory.create!(category)
end

people_data = [
  { name: 'ABD WAHAB BIN AWANG HASSAN', ics_no: '700614-03-5097', course_category: CourseCategory.first },
  { name: 'ARZU BIN ZAKARIA', ics_no: '780114-11-5771' },
  { name: 'AZAM BIN AZID', ics_no: '940621-03-5821' },
  { name: 'AZID BIN IBRAHIM', ics_no: '581009-03-5487' },
  { name: 'AZMAN BIN LATEH', ics_no: '820523-03-5493' },
  { name: 'AZMAN BIN MUHAMAD ARIFFIN', ics_no: '770506-03-6627' },
  { name: 'CHE ABDUL HALIFF BIN CHE ABDULLAH', ics_no: '920210-03-5845' },
  { name: 'CHE MUHAMMAD FAIZ BIN CHE ABDULLAH', ics_no: '971220-03-6059' },
  { name: 'MASHOR @ NASIR BIN ISMAIL', ics_no: '621109-03-5795' },
  { name: 'MOHAMAD SHAHRUL NIZAM BIN MOHD BADLISHAM', ics_no: '980126-03-5521' },
  { name: 'MOHAMMAD AIMAN BIN ISMAIL', ics_no: '901007-03-6267' },
  { name: 'MOHD AMIRUL BIN LOKMAN', ics_no: '900910-03-6605' },
  { name: 'MOHD ASRI BIN KASSIM', ics_no: '710515-03-5779' },
  { name: 'MOHD JAIS BIN JUSOH', ics_no: '751013-03-5227' },
  { name: 'MOHD NORHAFIZI BIN MOHD YAACOB', ics_no: '800117-03-5123' },
  { name: 'MOHD ZULKIFLY BIN YUSOFF', ics_no: '830921-03-5527' },
  { name: 'MUHAMAD SHUKRI BIN MAT HASSAN', ics_no: '910809-03-5703' },
  { name: 'MUHAMMAD AQIB BIN ROSTAN', ics_no: '980116-03-5915' },
  { name: 'MUHAMMAD HANIF BIN CHE MOHD ZANI', ics_no: '970627-03-6101' },
  { name: 'RAMLEE BIN MAHMUD', ics_no: '700507-03-5306' },
  { name: 'RAMLEE BIN MAT', ics_no: '820529-03-6059' },
  { name: 'RAZIE BIN AWANG LAH', ics_no: '900719-03-5401' },
  { name: 'ROSLAN BIN ABDULLAH', ics_no: '710711-03-5135' },
  { name: 'ROSWADI BIN JAKAR', ics_no: '750204-03-5487' },
  { name: 'SANUSI BIN YAAKU @ YAAKUB', ics_no: '730713-11-5049' },
  { name: 'SYAHRIL AZWADY BIN OTHMAN', ics_no: '770726-03-6637' },
  { name: 'ZAHARI BIN HAMZAH', ics_no: '880914-03-5655' },
  { name: 'ZAINUDIN BIN ABDULLAH', ics_no: '730915-07-5709' },
  { name: 'MOHAMAD BIN YUSOFF', ics_no: '820728-03-5075' },
]

# Create people
people_data.each do |person|
  Participant.create!(person)
end

puts 'Seed data created successfully.'