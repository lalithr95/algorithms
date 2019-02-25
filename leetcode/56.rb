def merge(intervals)
  i = 0
  intervals = intervals.sort_by { |interval| interval.first }
  new_intervals = []
  higher_bound = lower_bound = nil
  while (i < intervals.size - 1) do
    if intervals[i].last < intervals[i+1].first
      if lower_bound
        if lower_bound <= intervals[i].first
          if higher_bound && higher_bound >= intervals[i].last
            new_intervals << [lower_bound, higher_bound]
          else
            new_intervals << [lower_bound, intervals[i].last]
          end
        else
          if higher_bound && higher_bound >= intervals[i].last
            new_intervals << [intervals[i].first, higher_bound]
          else
            new_intervals << [intervals[i].first, intervals[i].last]
          end
        end
        lower_bound = higher_bound = nil
      else
        new_intervals << intervals[i]
      end
    else
      lower_bound = intervals[i].first
      higher_bound = intervals[i].last
    end

    i += 1
  end

  if lower_bound
    if lower_bound <= intervals[i].first
      if higher_bound && higher_bound >= intervals[i].last
        new_intervals << [lower_bound, higher_bound]
      else
        new_intervals << [lower_bound, intervals[i].last]
      end
    else
      if higher_bound && higher_bound >= intervals[i].last
        new_intervals << [intervals[i].first, higher_bound]
      else
        new_intervals << [intervals[i].first, intervals[i].last]
      end
    end
  else
    new_intervals << intervals[i]
  end

  new_intervals
end

def merge_by_sort(intervals)
  new_intervals = intervals.sort_by { |interval| interval.first }
  merged_intervals = []
  for interval in new_intervals do
    if merged_intervals.empty? || merged_intervals.last.last < interval.first
      merged_intervals << interval
    else
      merged_intervals.last[1] = [merged_intervals.last.last, interval.last].max
    end
  end
  merged_intervals
end

intervals = [[1,4],[0,0]]
print merge_by_sort(intervals)