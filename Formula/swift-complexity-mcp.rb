class SwiftComplexityMcp < Formula
  desc "MCP server exposing swift-complexity to LLM agents"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-arm64.tar.gz"
      sha256 "45a4dec2bb98bcbfd84e86744c613808585d3bcd41a8759764524fe5b0e1cd19"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-x86_64.tar.gz"
      sha256 "22e9e208679f6964d1fe89a7aba605800de94e69b477093069d47ecff8849c1d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-linux-x86_64.tar.gz"
      sha256 "cd923b76f6fbbbf9c86838d1ed361fa8e68b241a3acbda238946824c7508f474"
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
