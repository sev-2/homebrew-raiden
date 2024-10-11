class Raiden < Formula
  desc "Raiden"
  homepage "https://raiden.sev-2.com"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.25/raiden-macos-amd64"
      sha256 "fa665d0f529aa3af2dfa4c7613d218341faa70344a77b8b971dbb734957dbd29"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.25/raiden-macos-arm64"
      sha256 "c79f3b967780a16d84ba66290bce580d0a9cc9e97eb22b76d444020e24337284"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.25/raiden-linux-amd64"
      sha256 "d5fc4433ff96272181d803d6fa6cd027a0bafa94cac5b7f9bd1d3e647a9324d0"
    elsif Hardware::CPU.arm?
      url "https://github.com/sev-2/raiden/releases/download/v1.0.0-beta.25/raiden-linux-arm64"
      sha256 "169beb8512969d4b9a62854ab681616df5c30404865da38be0c3438e286aa0a7"
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
