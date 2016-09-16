
def leap_year?(x)
	multiple?(x, 100) ? multiple?(x, 400) : multiple?(x, 4)
end

def multiple?(numerator, denominator)
	numerator % denominator = 0
end



seconds_in_a_year = 31536000.0

def percent_of_a_year(seconds)
	format_in_percent((seconds / seconds_in_a_year) * 100)
end

def format_in_percent(n)
	('%.1f' % n) + '%'



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

	if hour.to_i < 12
		standard_time = a + b + " am"
	else
		c = a + b + " pm"
	end

	return c
end

def okay(a, b)
	c = false
	if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
		c = false
	else
		c = true
	end
	return c
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
