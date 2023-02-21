meetings1 = [
  { name: 'Meeting 1', duration: 1.5, type: :onsite },
  { name: 'Meeting 2', duration: 2, type: :offsite },
  { name: 'Meeting 3', duration: 1, type: :onsite },
  { name: 'Meeting 4', duration: 1, type: :offsite },
  { name: 'Meeting 5', duration: 1, type: :offsite }
]
meetings2 = [
  { name: 'Meeting 1', duration: 4, type: :offsite },
  { name: 'Meeting 2', duration: 4, type: :offsite }
]
meetings3 = [
  { name: 'Meeting 1', duration: 0.5, type: :offsite },
  { name: 'Meeting 2', duration: 0.5, type: :onsite },
  { name: 'Meeting 3', duration: 2.5, type: :offsite },
  { name: 'Meeting 4', duration: 3, type: :onsite }
]

class MeetingScheduler
  def initialize(meetings)
    @meetings = meetings
    @total_time = 0
    @schedule = []
    @start_time = Time.new(Time.new.year, Time.new.month, Time.new.day, 9)
    @end_time = Time.new(Time.new.year, Time.new.month, Time.new.day, 17)
    @off_site_meetings = []
    @on_site_meetings = []
  end

  def schedule_meetings
    if @meetings.length.zero?
      puts "bye\n\n"
      return
    end
    @meetings.each do |meeting|
      @total_time += (meeting[:type] == :onsite ? meeting[:duration] : (meeting[:duration] + 0.5))

      if (@off_site_meetings.empty? && @total_time > 8) || (!@off_site_meetings.empty? && @total_time >= 8)
        puts "this schedule does not fit\n\n"
        return
      end

      if meeting[:type] == :onsite
        @on_site_meetings << "#{clear_time(@start_time)} - #{clear_time(@start_time += (meeting[:duration] * 60**2))} - #{meeting[:name]} - #{meeting[:type]}"
      end

      if meeting[:type] == :offsite
        @off_site_meetings.unshift("#{clear_time(@end_time - (meeting[:duration] * 60**2))} - #{clear_time(@end_time)} -  #{meeting[:name]} - #{meeting[:type]}")
        @end_time -= ((meeting[:duration] * 60**2) + 0.5 * 60**2)
      end
    end
    @schedule << @on_site_meetings
    @schedule << @off_site_meetings
    puts "Total meet time : #{@total_time}, On Site meetings : #{@on_site_meetings.length}, Off Site meetings : #{@off_site_meetings.length}"
    puts @schedule
    puts "\n"
  end

  private

  def clear_time(time)
    time.strftime('%I:%M')
  end
end

meetings1 = MeetingScheduler.new(meetings1).schedule_meetings
meetings2 = MeetingScheduler.new(meetings2).schedule_meetings
meetings3 = MeetingScheduler.new(meetings3).schedule_meetings
