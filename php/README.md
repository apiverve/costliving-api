# Cost of Living API - PHP Package

Cost of Living is a cost of living API that provides index values for US regions based on major metropolitan area data. Compare the relative cost of living between states or cities, each mapped to its Census region, and calculate salary equivalents for relocation decisions on paid plans.

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/costliving?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/costliving?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/costliving?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
