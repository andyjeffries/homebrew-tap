class Nzbgrab < Formula
  desc "Fast parallel NZB downloader with PAR2 and extraction"
  homepage "https://github.com/andyjeffries/nzbgrab"
  url "https://github.com/andyjeffries/nzbgrab/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c96ebdbab168f1ac62bf3776891b6fc88f6cf161f8edbf9e3c61ab2e5be6c365"
  license "MIT"
  head "https://github.com/andyjeffries/nzbgrab.git", branch: "master"

  depends_on "go" => :build
  depends_on "par2" => :recommended
  depends_on "unrar" => :recommended
  depends_on "p7zip" => :recommended

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/nzbgrab"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nzbgrab --version")
  end
end
