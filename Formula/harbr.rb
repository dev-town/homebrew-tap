class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.2/harbr-0.1.0-beta.2-darwin-arm64.tar.gz"
      sha256 "cccf5b0ad4d5f6dd59f40de8f5cc8c4e77e26773bdd11cb873e95c4d58c740ed"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.2/harbr-0.1.0-beta.2-darwin-x64.tar.gz"
      sha256 "3bf1c85a271e3251a6ca5d1f632baca2b9fb18ff6285a46d8da32d2a940de58d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.2/harbr-0.1.0-beta.2-linux-arm64.tar.gz"
      sha256 "c3bff4df4e4ae7e5e73c1d617d79e4f6fdb0661d0de581c57f3171dc719e8410"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.2/harbr-0.1.0-beta.2-linux-x64.tar.gz"
      sha256 "4ddae937622c507ed6761f260beca9bbf5e389e2f1416c9ffdcf043703466318"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
