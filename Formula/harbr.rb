class Harbr < Formula
  desc "Workspace-aware terminal project manager"
  homepage "https://github.com/dev-town/harbr"
  version "0.1.0-beta.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.0/harbr-0.1.0-beta.0-darwin-arm64.tar.gz"
      sha256 "51dd7bb143a7bb493d7caff0141b74c98a5575e32bbe66de6fd38810360922af"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.0/harbr-0.1.0-beta.0-darwin-x64.tar.gz"
      sha256 "96c27a93f082aa8d9ed565569396d0b641eb228b025f681720c5f0285d369b30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.0/harbr-0.1.0-beta.0-linux-arm64.tar.gz"
      sha256 "3cb9e45c6ed556cd56298482345f6c6b17194fac85c23916c51b89a364fc263d"
    else
      url "https://github.com/dev-town/harbr/releases/download/v0.1.0-beta.0/harbr-0.1.0-beta.0-linux-x64.tar.gz"
      sha256 "87f00aeb233a9e812f92dd6b6d447a75b20dd5937870fe107264f8e74c4e1f07"
    end
  end

  def install
    bin.install "harbr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harbr --version")
  end
end
