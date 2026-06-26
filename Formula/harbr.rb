class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.1/harbr-0.1.0-beta.1-darwin-arm64.tar.gz"
      sha256 "6e473968c08e283ad0bb27d987b5a1ddf955729e1fa3bedb03d7e6c516bcdefc"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.1/harbr-0.1.0-beta.1-darwin-x64.tar.gz"
      sha256 "7d2b7cf10105e7cbc0a81fe352964915f27dab855f10fb529f549fcf11b72b8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.1/harbr-0.1.0-beta.1-linux-arm64.tar.gz"
      sha256 "36fcd0a60044bbc5f37b5cb36fdbbc7837758785bc02e9a8788171ac64b4660b"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.1/harbr-0.1.0-beta.1-linux-x64.tar.gz"
      sha256 "fb7d61b361d9f9ab12bebcec9be0cbdf2881192af68f05c0f53954e8d6a32197"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
