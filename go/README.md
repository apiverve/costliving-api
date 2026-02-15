# Cost of Living API - Go Client

Cost of Living provides cost of living indices for US regions based on major metropolitan area data. Compare the relative cost of living between states, cities, or regions and calculate salary equivalents for relocation decisions.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Go client for the [Cost of Living API](https://apiverve.com/marketplace/costliving?utm_source=go&utm_medium=readme)

---

## Installation

```bash
go get github.com/apiverve/costliving-api/go
```

---

## Configuration

Before using the Cost of Living API client, you need to obtain your API key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=go&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=go&utm_medium=readme)

The Cost of Living API documentation is found here: [https://docs.apiverve.com/ref/costliving](https://docs.apiverve.com/ref/costliving?utm_source=go&utm_medium=readme)

---

## Usage

```go
package main

import (
    "fmt"
    "log"

    "github.com/apiverve/costliving-api/go"
)

func main() {
    // Create a new client
    client := costliving.NewClient("YOUR_API_KEY")

    // Set up parameters
    params := map[string]interface{}{
        "location": "California",
        "compare": "Texas"
    }

    // Make the request
    response, err := client.Execute(params)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Printf("Status: %s\n", response.Status)
    fmt.Printf("Data: %+v\n", response.Data)
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=go&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=go&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=go&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=go&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
