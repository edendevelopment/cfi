<%= Student.all.to_json(:only => [:id], :methods => [:name_and_village]) %>
