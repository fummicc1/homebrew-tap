class SwiftComplexity < Formula
  desc "Analyze Swift code complexity (Cyclomatic, Cognitive, LCOM4)"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-arm64.tar.gz"
      sha256 "6215d2e34e539e3b90aeef6bb5f907b623b8057fa2be8ca36ca7dd06d3b1cf67"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-x86_64.tar.gz"
      sha256 "d3415bc7ece9503a6ddb3a0a7ddfa92f36f97a0b5b02e8cca455abaa28a9fe25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-linux-x86_64.tar.gz"
      sha256 "70fed0eb91daca5b21ddbf6d2f73ae0778932e23f47cbf11d343a726de248d9b"
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
