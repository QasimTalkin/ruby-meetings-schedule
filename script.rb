
meeting1 = [
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
on_site_meetings = []
off_site_meetings = []


def clear_time(time)
  time.strftime('%I:%M')
end

# Edge cases 
def schedule_meeting(meetings)
  if meetings.length.zero?
    puts "bye bye"
  end
end

schedule_meeting(meeting1)
