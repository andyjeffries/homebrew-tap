class Nzbgrab < Formula
  desc "Fast parallel NZB downloader with PAR2 and extraction"
  homepage "https://github.com/andyjeffries/nzbgrab"
  url "https://github.com/andyjeffries/nzbgrab/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "82a9d2f7f443e80204f86940a300bf26c4971deddae750abeee6b3133d2ab488"
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
