class LurayEngine < Formula
  desc "The fastest way to prototype a raylib game!"
  homepage "https://github.com/AdamGaskins/luray-engine"
  version "0.1.0-alpha.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AdamGaskins/luray-engine/releases/download/0.1.0-alpha.3/luray-0.1.0-alpha.3-macos-arm.tar.gz"
    sha256 "17bdb90bc19624369a38c3e63e0c22e96d7746ee2766c5eeeb13a4816726e45f"
  else
    odie "luray: no prebuilt binary for this platform yet (supported: macOS arm)"
  end

  def install
    bin.install "luray"
  end

  test do
    system "#{bin}/luray"
  end
end

