module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when 'the new course page'
      new_course_path
    when 'the course list page'
      courses_path
    when 'the student list page'
      students_path    
    when 'the new student page'
      new_student_path
    when /the student page for "([^\"]+)"/
      student_path(Student.find_by_name($1))
    when /the page for course "([^\"]+)"/
      course_path(Course.find_by_name($1))
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
