class Raiden < Formula
  desc "Raiden"
  homepage "https://raiden.sev-2.com"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.36/raiden-macos-amd64"
      sha256 "4812604e31a86973350c0b1fc9042dbfbd96bde59b5d801e5abf5d4c51297ead"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.36/raiden-macos-arm64"
      sha256 "fca400f5d64032f46b65c174c2094dd378085c6552c3a8e72fa0b4931959e9bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.36/raiden-linux-amd64"
      sha256 "2dc80840fd3ef76de5ccc33c08bc57dd26341b86ff0d091689b7511963b859b3"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.36/raiden-linux-arm64"
      sha256 "ddf8b97de68c076411a7d4b6732ec4c0c65009adbdbf9f3127025ab44e01c1a6"
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
