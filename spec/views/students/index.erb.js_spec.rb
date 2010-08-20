require 'spec_helper'

describe 'index' do
  def render_it
    render :template => 'students/index.erb.js'
  end

  it 'finds all the students' do
    Student.should_receive(:all)
    render_it
  end

  it 'renders the students as JSON' do
    all_students = mock(:data)
    Student.stub!(:all => all_students)
    all_students.should_receive(:to_json)
    render_it
  end
end
