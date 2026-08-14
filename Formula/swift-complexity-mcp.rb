class SwiftComplexityMcp < Formula
  desc "MCP server exposing swift-complexity to LLM agents"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-arm64.tar.gz"
      sha256 "569900b62149191d5ffbf47e70622905b6bed5e2fdeddce7f6229421dfd826df"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-x86_64.tar.gz"
      sha256 "9690edfeb0684e79293f19b28a4b345130d02d85539aa540dc8df2518f72625a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-linux-x86_64.tar.gz"
      sha256 "01381252b54d05d4295527ba7cbce688c5a8319b9a002be258e222cdefe66b02"
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
