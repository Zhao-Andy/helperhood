json.array! @programs.each do |program|
  json.partial! 'program.json.jbuilder', program: program
  if current_user && current_user.resident
    if ResidentProgram.find_by(user_id: current_user.id, program_id: program.id)
      json.liked ResidentProgram.find_by(user_id: current_user.id, program_id: program.id).support_status
      json.volunteer ResidentProgram.find_by(user_id: current_user.id, program_id: program.id).volunteer
    else
      json.liked false
      json.volunteer false
    end
  end
end
