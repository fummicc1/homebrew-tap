class SwiftComplexity < Formula
  desc "Analyze Swift code complexity (Cyclomatic, Cognitive, LCOM4)"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-arm64.tar.gz"
      sha256 "599ab9d4bf2e12775eb93f4a03ce8b3e3940c349ee63a0131e0c23f9d3941b98"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-x86_64.tar.gz"
      sha256 "8fea260b24db296ef1859410cde767af0844b214412a5c90bc9234b6e04a39da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-linux-x86_64.tar.gz"
      sha256 "2f3649633c696caa4145bd0dd55baf560a5ab3f13d4db3e9ea29fcf5580d570c"
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
