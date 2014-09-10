require 'rails_helper'

describe Link do
  it { should validate_presence_of :url}
  it { should validate_uniqueness_of :url }
  it { should validate_presence_of :headline }
  it { should validate_uniqueness_of :headline }
  it { should have_many :comments}
  # context '#next' do
  #   it 'returns the lesson with the next-highest number than the current lesson' do
  #     current_lesson = Lesson.create({:name => 'lesson1', :description => "mmm", :number => 1})
  #     next_lesson = Lesson.create({:name => 'lesson2', :description => "333", :number => 3})
  #     expect(current_lesson.next).to eq next_lesson
  #   end
  # end

  # context '#next' do
  #   it 'returns the lesson with the next-highest number than the current lesson' do
  #     current_lesson = Lesson.create({:name => 'lesson1', :description => "mmm", :number => 1})
  #     next_lesson = Lesson.create({:name => 'lesson2', :description => "333", :number => 3})
  #     expect(next_lesson.prev).to eq current_lesson
  #   end
  # end
# end



end
