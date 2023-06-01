require_relative '../person/student'
require 'rspec'

describe Student do
  let(:student) { Student.new(18, "John Doe") }

  describe "#initialize" do
    it "creates a new student with the given age, name, and parent permission" do
      expect(student.age).to eq(18)
      expect(student.name).to eq("John Doe")
      expect(student.rentals).to be_empty
    end

    it "defaults the name to 'Unknown' if not provided" do
      student = Student.new(20)
      expect(student.name).to eq("Unknown")
    end
  end

  describe "#classroom=" do
    it "assigns the student to the given classroom" do
      classroom = double("Classroom", students: [])
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it "does not add the student to the classroom if already present" do
      classroom = double("Classroom", students: [student])
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end

  describe "#to_hash" do
    it "returns a hash representation of the student" do
      hash = student.to_hash
      expect(hash).to be_a(Hash)
      expect(hash[:age]).to eq(18)
      expect(hash[:name]).to eq("John Doe")
      expect(hash[:parent_permission]).to be true
      expect(hash[:type]).to eq("student")
    end
  end

  describe ".from_hash" do
    it "creates a new student from a hash representation" do
      hash = { age: 20, name: "Jane Smith", parent_permission: false, type: "student" }
      student = Student.from_hash(hash)
      expect(student).to be_an_instance_of(Student)
      expect(student.age).to eq(20)
      expect(student.name).to eq("Jane Smith")
      expect(student.rentals).to be_empty
    end
  end
end
