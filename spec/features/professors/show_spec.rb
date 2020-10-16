# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#      "Hermione Granger"
#      "Luna Lovegood")

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the '/professors/:id' path" do
    it "can see a list of student names taught by that professor" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      expect(page).to have_content("#{harry.name}")
      expect(page).to have_content("#{malfoy.name}")
      expect(page).to have_content("#{longbottom.name}")
    end
  end
end
