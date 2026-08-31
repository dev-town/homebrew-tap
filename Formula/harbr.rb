class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.7"
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
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.7/harbr-0.1.0-beta.7-darwin-arm64.tar.gz"
      sha256 "4f8eb19077c22bc0c03c0c582e74ba1b75110a369736d3019e1bd306c26264f3"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.7/harbr-0.1.0-beta.7-darwin-x64.tar.gz"
      sha256 "fafd84ab21a063a03b877512b71b6cc84a2fc3dfdcaa716a636b5b01bdc2e95b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.7/harbr-0.1.0-beta.7-linux-arm64.tar.gz"
      sha256 "40b456f147e519f631e59449273d87653e5347ca21f71e2a9a84702b6e049f65"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.7/harbr-0.1.0-beta.7-linux-x64.tar.gz"
      sha256 "72e22ae21947a13f249375f8044ad28e2fb31838e3a25c769b571955db11cdce"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
