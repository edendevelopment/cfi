var student_data = <%= Student.all.to_json(:only => [:id], :methods => [:name_and_village]) %>
