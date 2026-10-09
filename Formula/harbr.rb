class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]

        release["tag_name"]&.[](regex, 1)
      end
    end
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0/harbr-0.1.0-darwin-arm64.tar.gz"
      sha256 "bbedc89db6018ffea2b60a76b942c32b2cc657c32f18cff529fba03ee2d845df"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0/harbr-0.1.0-darwin-x64.tar.gz"
      sha256 "9a7eb826317a2c18485063a69d3732bd817b5e306c79c94d2b9c913f01ed1c2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0/harbr-0.1.0-linux-arm64.tar.gz"
      sha256 "cc9f5dc9d783629cbad988cfecfd9df3e430c58c740ec91d820b0eb5227c9eac"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0/harbr-0.1.0-linux-x64.tar.gz"
      sha256 "fcc36984cbbe983008e5c52b9c0cb113c04c802ce3b79fbb80891016f733da5d"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
