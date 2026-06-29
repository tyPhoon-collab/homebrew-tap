class ObsidianPreferenceSync < Formula
  desc "Synchronize selected Obsidian plugins, plugin settings, and app settings"
  homepage "https://github.com/tyPhoon-collab/obsidian-preference-sync"
  url "https://github.com/tyPhoon-collab/obsidian-preference-sync/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "d7ee88f2ad03735424003cec5ef2d3d37844ea9c55f57c70ef172a42af23089e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-mod=vendor",
      "-trimpath",
      "-ldflags", "-s -w",
      "-o", bin/"obsidian-preference-sync",
      "./cmd/obsidian-preference-sync"
  end

  test do
    output = shell_output("#{bin}/obsidian-preference-sync 2>&1", 2)
    assert_match "--vault is required", output
  end
end
