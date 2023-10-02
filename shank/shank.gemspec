# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "shank"
  spec.version       = "0.1.0"
  spec.authors       = ["Kyle Shank"]
  spec.email         = ["kyle.shank@gmail.com"]

  spec.summary       = "shank"
  spec.homepage      = "https://kyleshank.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
end
