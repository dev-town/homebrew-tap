class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-[0-9A-Za-z.-]+)?)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        release["tag_name"]&.[](regex, 1)
      end
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.4/harbr-0.1.0-beta.4-darwin-arm64.tar.gz"
      sha256 "ce406ba9f79df0c991e25e98606228b3c11eceaa2e810166e4e93386ed6b61e9"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.4/harbr-0.1.0-beta.4-darwin-x64.tar.gz"
      sha256 "cefde84e06aa0d367edb9940601264b4f98d627972291a350acb95858349147b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.4/harbr-0.1.0-beta.4-linux-arm64.tar.gz"
      sha256 "278a9d909fcf4eb9ba56f396e96aaade01435161555a17c94d6dcbbe71807543"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.4/harbr-0.1.0-beta.4-linux-x64.tar.gz"
      sha256 "b13fe73b73ee60469b26d190ebb2a89d5996ab8f702a1c6e4cbe546372b1ea7d"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
