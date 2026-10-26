# Cost of Living API - Dart/Flutter Client

Cost of Living is a cost of living API that provides index values for US regions based on major metropolitan area data. Compare the relative cost of living between states or cities, each mapped to its Census region, and calculate salary equivalents for relocation decisions on paid plans.

[![pub package](https://img.shields.io/pub/v/apiverve_costliving.svg)](https://pub.dev/packages/apiverve_costliving)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Cost of Living API](https://apiverve.com/marketplace/costliving?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_costliving: ^1.2.3
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
      'location': 'California'
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

## API Reference

- **API Home:** [Cost of Living API](https://apiverve.com/marketplace/costliving?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/costliving](https://docs.apiverve.com/ref/costliving?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
