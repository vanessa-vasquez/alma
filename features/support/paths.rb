# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (Alma)?home\s?page$/ then '/'
    when /^My Profile page$/ then my_profile_tasks_path
    when /^the All Tasks page$/ then tasks_path
    when /^the Create Task page$/ then new_task_path
    when /^the View Task page for "(.+)"$/ then task_path(Task.find_by(name:$1).id)
    when /^the Edit Task page for "(.+)"$/ then edit_task_path(Task.find_by(name:$1).id)
    when /^the login page$/ then new_user_session_path
    when /^the sign up page$/ then new_user_registration_path
    when /^accept_tasks$/ then accept_tasks_path
  
      


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
