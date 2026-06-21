class SwiftComplexity < Formula
  desc "Analyze Swift code complexity (Cyclomatic, Cognitive, LCOM4)"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-arm64.tar.gz"
      sha256 "8040cc7702389516e541e8b09dbf0ebfa654e1caca59b1a32f92681a37bfa2e6"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-x86_64.tar.gz"
      sha256 "3791b6833ab5bae7a3f5e3f018505d7384b945b0926edfbb12ab2eeaf5619a1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-linux-x86_64.tar.gz"
      sha256 "5c1421b13aa6eb067843ea9a19df0f8e611a367df73e0c9c2963e42925718c42"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "SwiftComplexityCLI" => "swift-complexity"
    doc.install "README.md"
    doc.install "docs" if File.directory?("docs")
  end

  test do
    output = shell_output("#{bin}/swift-complexity --help")
    assert_match "Analyze Swift code complexity", output
  end
end
