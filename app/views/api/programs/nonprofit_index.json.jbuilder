json.array! @nonprofit_programs_array.each do |program|
  json.partial! 'program.json.jbuilder', program: program.program
  @donations_array.each do |donation|
    json.donation_amount donation.donation_amount
  end
  total_supporters = ResidentProgram.where(program_id: program.id).where(support_status: true).count
  total_volunteers = ResidentProgram.where(program_id: program.id).where(volunteer: true).count
  json.total_supporters total_supporters
  json.total_volunteers total_volunteers
end
