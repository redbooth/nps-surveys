# This module provides a simple helper to parse the json response from a
# controller spec.
module ApiJsonParser
  def parsed_json
    JSON.parse(response.body)
  end
end
