class SwiftComplexity < Formula
  desc "Analyze Swift code complexity (Cyclomatic, Cognitive, LCOM4)"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-arm64.tar.gz"
      sha256 "4ae3c5d5f1aa643f29b4bc7de5f2bcd13a2b80036f2da41e5ff658f49dac80b3"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-macos-x86_64.tar.gz"
      sha256 "a7a8b35c4537ddad57878bdec4107885e9c84ecd361a16eda5539e3aaef5ed9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityCLI-#{version}-linux-x86_64.tar.gz"
      sha256 "2a8c7f7fa6577af73da2a294c704d25d49bf463dacfc930bc5999bc24bc1bbdb"
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
