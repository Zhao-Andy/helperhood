json.array! @resident_programs.each do |resident_program|
  json.partial! 'resident_program.json.jbuilder', resident_program: resident_program
end
