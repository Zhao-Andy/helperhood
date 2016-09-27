json.array! @resident_programs_array.each do |program|
  json.partial! 'program.json.jbuilder', program: program.program
  json.support_status program.support_status
  json.volunteer program.volunteer
  @donations_array.each do |donation|
    json.donation_amount donation.donation_amount
  end
end
