class ObsidianPreferenceSync < Formula
  desc "Synchronize selected Obsidian plugins, plugin settings, and app settings"
  homepage "https://github.com/tyPhoon-collab/obsidian-preference-sync"
  url "https://github.com/tyPhoon-collab/obsidian-preference-sync/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "13baa0abd09c348e989a1ce4ba551c35409bb50c6c7ac18eca32c1dc40aafa83"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-mod=vendor",
      "-trimpath",
      "-ldflags", "-s -w -X main.version=v0.7.2",
      "-o", bin/"obsidian-preference-sync",
      "./cmd/obsidian-preference-sync"
  end

  test do
    output = shell_output("#{bin}/obsidian-preference-sync 2>&1", 2)
    assert_match "--vault is required", output
  end
end
