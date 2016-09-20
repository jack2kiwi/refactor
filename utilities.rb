
def leap_year?(x)
	x % 100 == 0 ? x % 400 == 0 : x % 4 == 0
end

def percent_of_a_year(seconds)
	seconds_in_a_year = 31536000.0
	format_in_percent((seconds / seconds_in_a_year) * 100)
end

def format_in_percent(n)
	('%.1f' % n) + '%'
end


def standard_to_military_time(x)
	hour, minutes_and_meridian = x.split(":")
	minutes, meridian = minutes_and_meridian.split(" ")
	military_time = ""

	if meridian.downcase == 'pm'
		if hour.to_i == 12
			military_time = hour + ":" + minutes
		else
			military_time = (hour.to_i + 12).to_s + ":" + minutes
		end
	elsif meridian.downcase == 'am'
		if hour.to_i == 12
			military_time = (hour.to_i - 12).to_s + ":" + minutes
		else
			military_time = hour + ":" + minutes
		end
	end

	return military_time
end

def military_to_standard_time(x)
	hour, minutes = x.split(":")
	standard_time = ""
	hour = hour.to_i

	if hour == 0
		standard_time = (hour + 12).to_s + ':' + minutes + " am"
	elsif hour > 12
		standard_time = (hour - 12).to_s + ':' + minutes + " pm"
	elsif hour == 12
		standard_time = hour.to_s + ':' + minutes + " pm"
	else
		standard_time = hour.to_s + ':' + minutes + " am"
	end

	return standard_time
end

def curfew?(time, is_weekday)
	hour, minutes_and_meridian = time.split(":")
	minutes, meridian = minutes_and_meridian.split(" ")
  hour = hour.to_i
  (is_weekday ? hour >= 8 : hour >= 10) || meridian == 'am'
end

def span(a, b)
	c = 0
	d = 0
	if a < b
		c = b
		d = a
	else
		c = a
		d = b
	end

	return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
end
