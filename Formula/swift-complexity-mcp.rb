class SwiftComplexityMcp < Formula
  desc "MCP server exposing swift-complexity to LLM agents"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-arm64.tar.gz"
      sha256 "64ec2486eb86d38290978ad09e84118a4f0c1e5d63d7b09ba902205af5e44093"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-x86_64.tar.gz"
      sha256 "724af826dea2d519dd024656b1b74ac77a6b4935de144cf3545719b42de9845d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-linux-x86_64.tar.gz"
      sha256 "6969ba29fd43ac21b58153584edac13965d1d90155d612553d288847a5f86dfb"
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
