class SwiftComplexityMcp < Formula
  desc "MCP server exposing swift-complexity to LLM agents"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-arm64.tar.gz"
      sha256 "fb2f4281ce1bba7b9655d656b6e7d44c41b31db80993018771006b6abd641ad7"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-x86_64.tar.gz"
      sha256 "67ca2291cd226dd590c88d39ca5d271ce8fdb9b62dc47439cf588974659cc182"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-linux-x86_64.tar.gz"
      sha256 "e785c42e4aa24896182decdcb3ef4bb74d2de6a794406fdf42b8b37dddd8b653"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "SwiftComplexityMCP"
  end

  test do
    assert_predicate bin/"SwiftComplexityMCP", :executable?
  end
end
