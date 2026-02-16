# Cost of Living API - Dart/Flutter Client

Cost of Living provides cost of living indices for US regions based on major metropolitan area data. Compare the relative cost of living between states, cities, or regions and calculate salary equivalents for relocation decisions.

[![pub package](https://img.shields.io/pub/v/apiverve_costliving.svg)](https://pub.dev/packages/apiverve_costliving)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Cost of Living API](https://apiverve.com/marketplace/costliving?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_costliving: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_costliving/apiverve_costliving.dart';

void main() async {
  final client = CostlivingClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'location': 'California',
      'compare': 'Texas'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Cost of Living API](https://apiverve.com/marketplace/costliving?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/costliving](https://docs.apiverve.com/ref/costliving?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
