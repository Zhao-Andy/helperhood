json.array! @donations.each do |donation|
  json.partial! 'donation.json.jbuilder', donation: donation
end
