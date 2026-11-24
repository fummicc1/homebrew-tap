class SwiftComplexityMcp < Formula
  desc "MCP server exposing swift-complexity to LLM agents"
  homepage "https://github.com/fummicc1/swift-complexity"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-arm64.tar.gz"
      sha256 "0bddc8b788d30b7924baaf16e56c8ac0c644895d4ea5bb17e7583102906cb970"
    end
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-macos-x86_64.tar.gz"
      sha256 "a6ec0272d68966e889d025a90ea301ed018cf6cd2bbe3a831ea98f61c78ed572"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fummicc1/swift-complexity/releases/download/v#{version}/SwiftComplexityMCP-#{version}-linux-x86_64.tar.gz"
      sha256 "bef87781ea37f56c95fb2b2076d4c4667b35a9252bc693eba591eb351ce92da7"
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
