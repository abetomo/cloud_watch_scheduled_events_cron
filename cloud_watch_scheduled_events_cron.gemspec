
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cloud_watch_scheduled_events_cron/version"

Gem::Specification.new do |spec|
  spec.name          = "cloud_watch_scheduled_events_cron"
  spec.version       = CloudWatchScheduledEventsCron::VERSION
  spec.authors       = ["abetomo"]
  spec.email         = ["abe@enzou.tokyo"]

  spec.summary       = %q{Convert crontab expression to CloudWatch expression.}
  spec.description   = %q{Convert crontab expression to CloudWatch expression.}
  spec.homepage      = "https://github.com/abetomo/cloud_watch_scheduled_events_cron"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["to_cwcec"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
end
