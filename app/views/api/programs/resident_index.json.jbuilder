json.array! @resident_programs_array.each do |program|
  json.partial! 'program.json.jbuilder', program: program.program
  json.liked program.support_status
  json.volunteer program.volunteer
end
