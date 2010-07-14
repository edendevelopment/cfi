require 'spec_helper'

describe 'index' do
  def render_it
    render :template => 'students/index.erb.js'
  end

  it 'finds all the students' do
    Student.should_receive(:all)
    render_it
  end

  it 'binds student_data in rendered file' do
    render_it
    response.body.include?('var student_data =').should be_true
  end

  it 'renders the students as JSON' do
    all_students = mock(:data)
    Student.stub!(:all => all_students)
    all_students.should_receive(:to_json)
    render_it
  end
end
