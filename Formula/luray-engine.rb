class LurayEngine < Formula
  desc "The fastest way to prototype a raylib game!"
  homepage "https://github.com/AdamGaskins/luray-engine"
  version "0.1.0-alpha.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AdamGaskins/luray-engine/releases/download/0.1.0-alpha.2/luray-0.1.0-alpha.2-macos-arm.tar.gz"
    sha256 "12ba025ac103e2fa463acb42492b3d1bf2efd3a4e15cfca4fade906b8c7d1e34"
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

