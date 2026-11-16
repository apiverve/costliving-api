# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_costliving"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Cost of Living API - Ruby Client"
  spec.description   = "Cost of Living is a cost of living API that returns price-level indices for US states and metropolitan areas, with the US average at 100. Compare the relative cost of living between two states or cities and calculate salary equivalents for relocation decisions on paid plans."
  spec.homepage      = "https://apiverve.com/marketplace/costliving?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/costliving-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/costliving"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
