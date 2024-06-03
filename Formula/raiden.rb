class Raiden < Formula
  desc "Raiden"
  homepage "https://raiden.sev-2.com"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.1/raiden-macos-amd64"
      sha256 "dc1d8e2a5d1ed39689a2ce098d588787e9c852dbc0dce6a0394c402f8439da7b"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.1/raiden-macos-arm64"
      sha256 "f6c12c161b20b161714f84f75458888af2298caf2d71a43b2a1256f046dbfb18"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.1/raiden-linux-amd64"
      sha256 "829c146f4d8035bcaa16e645d208b632723112c85f2ef8105da0e17fff721a4e"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.1/raiden-linux-arm64"
      sha256 "a8bd3dad976de4134f324778d96888239f9b760f6c84107333954020c2080f9b"
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
