class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.3"
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
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.3/harbr-0.1.0-beta.3-darwin-arm64.tar.gz"
      sha256 "d3ddb2807dedf9861e891ae8cf34d7547d66e906dd05770b2acc628a4291dc06"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.3/harbr-0.1.0-beta.3-darwin-x64.tar.gz"
      sha256 "c4a28550ac76f74a04b7dfbb59c598bb8657b66419a534fcd12ccd603e755914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.3/harbr-0.1.0-beta.3-linux-arm64.tar.gz"
      sha256 "133ad73adf0692c0f472a9405db85241dc1ee6cd189ed4ac68d2c3e7eca4529b"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.3/harbr-0.1.0-beta.3-linux-x64.tar.gz"
      sha256 "97c99fc6cf642dfee6e176a6174ea4620458e971a0be02d9f4f19632e2aacfc9"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
