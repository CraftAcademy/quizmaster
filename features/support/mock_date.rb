def mock_date_to_date(time)
  "MockDate.set('#{time}'); var date = currentDate();"
end

def mock_date_add_seconds(value)
  "var date = new Date(Date.now()); date.addSeconds(#{value}); MockDate.set(date.toString())"
end

def mock_date_reset
  'MockDate.reset()'
end

