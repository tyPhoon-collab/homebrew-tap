class ObsidianPreferenceSync < Formula
  desc "Synchronize selected Obsidian plugins, plugin settings, and app settings"
  homepage "https://github.com/tyPhoon-collab/obsidian-preference-sync"
  url "https://github.com/tyPhoon-collab/obsidian-preference-sync/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "0e0d4af1c769d41cdeb647d9b312e8b0da26b52fb7c4b139368afe165b58e4bc"
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
