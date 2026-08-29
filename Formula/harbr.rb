class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.6"
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
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.6/harbr-0.1.0-beta.6-darwin-arm64.tar.gz"
      sha256 "eb784a846e7aaef13497d9bfdb35a2ceeb683112399cf69699cd6e33d55653d6"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.6/harbr-0.1.0-beta.6-darwin-x64.tar.gz"
      sha256 "c079f59b78035d439242e5cb2890d2713ac05e99379fa7d0ff42f2d7275501a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.6/harbr-0.1.0-beta.6-linux-arm64.tar.gz"
      sha256 "e3932f76cd69c52f440827d44f3831b7358b8f5de76abc6b3c3e0740591f638b"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.6/harbr-0.1.0-beta.6-linux-x64.tar.gz"
      sha256 "111dc6f32e4d957d0fb5d3cfa7f3e8fae59047140fd2dba91c42c6e87316843c"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
