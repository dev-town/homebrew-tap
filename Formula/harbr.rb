class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.8"
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
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.8/harbr-0.1.0-beta.8-darwin-arm64.tar.gz"
      sha256 "544ae0c14ad76d9ae6bb140729a56a3667a8afe9e7e144c3bc377d20a3008ce0"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.8/harbr-0.1.0-beta.8-darwin-x64.tar.gz"
      sha256 "23aa10e0599de2f9d9ce0a2017b78d63d4b9cee028d10f9a4e777c70dbc82c59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.8/harbr-0.1.0-beta.8-linux-arm64.tar.gz"
      sha256 "6ec607a3475c18c7f5e660738dd29e85c2379b1cdbc36a1862f0ab4d53776f0e"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.8/harbr-0.1.0-beta.8-linux-x64.tar.gz"
      sha256 "8ff401c227bac446f7785b9c1a91bdd60147ecdaedf5a42243a634696509fe7e"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
