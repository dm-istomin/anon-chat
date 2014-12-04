def display_errors
  errors = session[:errors]
  session[:errors] = nil
  return format_errors(errors)
end

def format_errors(errors)
  if errors.is_a? Hash
    message = ""
    errors.each do |key, value|
      message << "#{key}: #{value.uniq.join('')}"
    end
  else
    errors
  end
  message
end
