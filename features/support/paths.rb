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
    when 'the household list page'
      households_path
    when 'the person list page'
      people_path    
    when 'the new person page'
      new_person_path
    when /the person page for "([^\"]+)"/
      person_path(Person.find_by_name($1))
    when /the sibling page for "([^\"]+)"/
      siblings_person_path(Person.find_by_name($1))
    when /the photos page for "([^\"]+)"/
      person_photos_path(Person.find_by_name($1))
    when /the page for course "([^\"]+)"/
      course_path(Course.find_by_name($1))
    when /the page for household "([^\"]+)"/
      household_path(Household.find_by_caretaker($1))
    when 'login'
      new_user_session_path
    when 'the villages page'
      villages_path
    when /the page for village "([^\"]+)"/
      village_path(Village.find_by_name($1))
    when /the caretaker page for "([^\"]+)"/
      caretakers_person_path(Person.find_by_name($1))
    when /the note edit page for "([^\"]+)" on household "([^\"]+)"/
      edit_household_comment_path(Household.find_by_caretaker($2), Comment.find_by_comment($1))

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
