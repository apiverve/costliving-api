# Cost of Living API - Ruby Gem

Cost of Living is a cost of living API that provides index values for US regions based on major metropolitan area data. Compare the relative cost of living between states or cities, each mapped to its Census region, and calculate salary equivalents for relocation decisions on paid plans.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_costliving'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_costliving
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_costliving'

# Initialize the client
client = APIVerve::Costliving::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ location: "California" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ location: "California" })
  puts response["data"]
rescue APIVerve::Costliving::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Costliving::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Costliving::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "searchedLocation": "California",
    "region": "west-large",
    "regionName": "West Large Metros (LA, SF, Seattle, Phoenix, Denver area)",
    "costIndex": 107,
    "description": "7% above average",
    "cpi": 356.993,
    "usAverageCPI": 334.98,
    "period": "2026-08",
    "note": "Cost index is relative to US average (100). Values above 100 indicate higher than average cost of living."
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/costliving?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/costliving?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/costliving?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
