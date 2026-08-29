class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.5"
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
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.5/harbr-0.1.0-beta.5-darwin-arm64.tar.gz"
      sha256 "a4ba9498438b609f2a50d23590b9331e3547e6714f92390440b40d579c5d430b"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.5/harbr-0.1.0-beta.5-darwin-x64.tar.gz"
      sha256 "ab994bb2ebe75dbaf2d8e4343e72682da919f3800c0c81fc59119fa36eee0295"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.5/harbr-0.1.0-beta.5-linux-arm64.tar.gz"
      sha256 "bdda45ccfe04879ea3c19dfc3af9d75878854fc229970556686a52a2bd96cbf6"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.5/harbr-0.1.0-beta.5-linux-x64.tar.gz"
      sha256 "2562278dc754b0b6a67e35b9274d373c450d907d07b90450a73bfb12bcd5ea32"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
