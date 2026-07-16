# Cost of Living API - PHP Package

Cost of Living provides cost of living indices for US regions based on major metropolitan area data. Compare the relative cost of living between states, cities, or regions and calculate salary equivalents for relocation decisions.

## Installation

Install via Composer:

```bash
composer require apiverve/costliving
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Costliving\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['location' => 'California']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Costliving\Client;
use APIVerve\Costliving\Exceptions\APIException;
use APIVerve\Costliving\Exceptions\ValidationException;

try {
    $response = $client->execute(['location' => 'California']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "from": {
      "searchedLocation": "California",
      "region": "west-large",
      "regionName": "West Large Metros (LA, SF, Seattle, Phoenix, Denver area)",
      "costIndex": 118
    },
    "to": {
      "searchedLocation": "Texas",
      "region": "south-large",
      "regionName": "South Large Metros (Dallas, Houston, Atlanta, Miami, DC area)",
      "costIndex": 103
    },
    "comparison": {
      "costDifference": -12.7,
      "direction": "less expensive",
      "salaryEquivalent": {
        "description": "A $100,000 salary in California is equivalent to $87,288 in Texas",
        "fromSalary": 100000,
        "equivalentSalary": 87288
      }
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/costliving?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/costliving?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/costliving?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
