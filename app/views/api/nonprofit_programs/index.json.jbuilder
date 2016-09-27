json.array! @nonprofit_programs.each do |nonprofit_program|
  json.partial! 'nonprofit_program.json.jbuilder', nonprofit_program: nonprofit_program
end
