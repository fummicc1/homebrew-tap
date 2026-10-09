class SwiftComplexity < Formula
  desc "Analyze Swift code complexity (Cyclomatic, Cognitive, LCOM4)"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-arm64.tar.gz"
      sha256 "a54d2731acacbe912bb42f61b81836fe3c18dbbed12469fb812436a0d3f10ffb"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-x86_64.tar.gz"
      sha256 "fd19138ed553188e2b4856af8f3e848355112b74f1094cfef60f9a1d46a3eafa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-linux-x86_64.tar.gz"
      sha256 "7c61aeb5b800a00f512a78794d98eb7f6c4e8a30cf5f4e6f35d017be5ef35a2d"
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
