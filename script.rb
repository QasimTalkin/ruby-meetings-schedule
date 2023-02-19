
meetings = [
  { name: 'Meeting 1', duration: 1.5, type: :onsite },
  { name: 'Meeting 2', duration: 2, type: :offsite },
  { name: 'Meeting 3', duration: 1, type: :onsite },
  { name: 'Meeting 4', duration: 1, type: :offsite },
  { name: 'Meeting 5', duration: 1, type: :offsite }
]
meeting2 = [
  { name: 'Meeting 1', duration: 4, type: :offsite },
  { name: 'Meeting 2', duration: 4, type: :offsite }
]
meeting3 = [
  { name: 'Meeting 1', duration: 0.5, type: :offsite },
  { name: 'Meeting 2', duration: 0.5, type: :onsite },
  { name: 'Meeting 3', duration: 2.5, type: :offsite },
  { name: 'Meeting 4', duration: 3, type: :onsite }
]

total_time = 0
schedule = []
start_time = Time.new(Time.new.year, Time.new.month, Time.new.day, 9)
end_time = Time.new(Time.new.year, Time.new.month, Time.new.day, 17)
off_site_meetings = []
on_site_meetings = []

if meetings.length.zero?
  puts 'bye'
  return
end

meetings.each do |meeting|
  total_time += meeting[:duration]
  if off_site_meetings.empty? && total_time > 8
    puts 'this schedule does not fit'
    return
  elsif !off_site_meetings.empty? && total_time > 7.5
    puts 'this schedule does not fit'
    return
  end

  if meeting[:type] == :onsite
    on_site_meetings << "#{start_time.strftime('%I:%M')} - #{(start_time += (meeting[:duration] * 60**2)).strftime('%I:%M')} - #{meeting[:name]} - #{meeting[:type]}"
  end

  if meeting[:type] == :offsite
    off_site_meetings.unshift("#{(end_time-(meeting[:duration]*60**2)).strftime("%I:%M")} - #{end_time.strftime("%I:%M")} -  #{meeting[:name]} - #{meeting[:type]}")
 end_time-=(meeting[:duration]*60**2)
 end
end
schedule << on_site_meetings
schedule << off_site_meetings
puts "Total meet time : #{total_time}, On Site meetings : #{on_site_meetings.length}, Off Site meetings : #{off_site_meetings.length}"
puts schedule
