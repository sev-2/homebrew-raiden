class Raiden < Formula
  desc "Raiden"
  homepage "https://raiden.sev-2.com"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.40/raiden-macos-amd64"
      sha256 "6cd4e0f8fdbb01c8095eeef3414cbe83ec930cc33714a57e7eeeb1282a53724e"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.40/raiden-macos-arm64"
      sha256 "28131e134ebd90cdb3b0b9710f8b296901ecb227accc25567dd5e704bff1d238"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.40/raiden-linux-amd64"
      sha256 "b38b82ba9a2812d02b10b7a3bb42944d27aba0da2d8784f597eb7aece93f66ca"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.40/raiden-linux-arm64"
      sha256 "2dd8e060cbf6e837ad23b593d3573e52a13029e7460807814225b125fead2140"
    end
  end

  def install
    binary_path = Dir["**/raiden-*"].first
    bin.install binary_path => "raiden"
  end

  test do
    system "#{bin}/raiden", "version"
  end
end
