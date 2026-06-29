class ObsidianPreferenceSync < Formula
  desc "Synchronize selected Obsidian plugins, plugin settings, and app settings"
  homepage "https://github.com/tyPhoon-collab/obsidian-preference-sync"
  url "https://github.com/tyPhoon-collab/obsidian-preference-sync/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "c672198e89848a1576fdc06600d964dc9f70a0500a57a4aa06ea50d53a09929a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-mod=vendor",
      "-trimpath",
      "-ldflags", "-s -w -X main.version=v0.7.1",
      "-o", bin/"obsidian-preference-sync",
      "./cmd/obsidian-preference-sync"
  end

  test do
    output = shell_output("#{bin}/obsidian-preference-sync 2>&1", 2)
    assert_match "--vault is required", output
  end
end
