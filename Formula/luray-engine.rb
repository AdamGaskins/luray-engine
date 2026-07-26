class LurayEngine < Formula
  desc "The fastest way to prototype a raylib game!"
  homepage "https://github.com/AdamGaskins/luray-engine"
  version "0.1.0-alpha.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AdamGaskins/luray-engine/releases/download/0.1.0-alpha.4/luray-0.1.0-alpha.4-macos-arm.tar.gz"
    sha256 "cd8007e2938faf4016fafedc7a82f2d381b712e27b6134e2e47071fa253707d7"
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

