def min_meeting_rooms(intervals)
  intervals = intervals.sort_by { |interval| interval.first }
  return 0 if intervals.empty?
  meeting_rooms = 1
  meeting_end_times = [intervals[0][1]]
  for i in 1..(intervals.size - 1) do
    if meeting_end_times.min  < intervals[i].first
      meeting_end_times.delete(meeting_end_times.min)
      meeting_rooms -= 1
    elsif intervals[i-1].last > intervals[i].first && !meeting_end_times.include?(intervals[i].first)
      meeting_rooms += 1
      meeting_end_times << intervals[i].last
    end
  end

  meeting_rooms
end

intervals = [[12,13],[8,14],[6,9]]
print min_meeting_rooms(intervals)