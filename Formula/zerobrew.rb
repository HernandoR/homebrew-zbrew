class Zerobrew < Formula
  desc "Package manager alternative to Homebrew, in Rust (fork; v0.3.3-rc.1 is a pre-release)"
  homepage "https://github.com/HernandoR/zerobrew"
  version "0.3.3-rc.1"
  license all_of: ["Apache-2.0", "MIT"]

  # This tap tracks HernandoR/zerobrew, a maintained fork of the unmaintained
  # lucasgelfond/zerobrew. The only release the fork has published so far is a
  # pre-release, so that is what this formula installs. It will be repointed at
  # 0.3.3 when that ships.

  on_macos do
    on_arm do
      url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zb-darwin-arm64"
      sha256 "4e789854a598206559a40c1c65712372b8728aef4e334773ae17965c732068ef"

      resource "zbx" do
        url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zbx-darwin-arm64"
        sha256 "279666e5478f7507f61a7f5ec4eb7f677ab02156384087ec9633d09a04ddaaea"
      end
    end
    on_intel do
      url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zb-darwin-x64"
      sha256 "51ea7da1a1f309cfb3dbfed666d9e9301321f79e5d36d19a1ff37aabade18105"

      resource "zbx" do
        url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zbx-darwin-x64"
        sha256 "12daef50ffeaf5dcc0452fc966a103f046aa3a72a649efafdac77c3f14eaff0c"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zb-linux-arm64"
      sha256 "7e2e271e013c792158a5219133b25d76cb62759c8f8b21e229eeecd4f102edcd"

      resource "zbx" do
        url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zbx-linux-arm64"
        sha256 "7ce6097f8365974518d25549a65773dd265b070b47749d04f09863a9ced0ed59"
      end
    end
    on_intel do
      url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zb-linux-x64"
      sha256 "fc074e93245c98c1b68274e67945943c994efc2653012d678185015d94b70ad8"

      resource "zbx" do
        url "https://github.com/HernandoR/zerobrew/releases/download/v0.3.3-rc.1/zbx-linux-x64"
        sha256 "280f26ba6f315299b61963e3dc29ab715ff9ef5ca1c20cba1ab68ffc06bd5153"
      end
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"

    bin.install "zb-#{os}-#{arch}" => "zb"

    # zbx locates zb as a sibling of its own executable, so both have to land
    # in the same bin directory.
    resource("zbx").stage do
      bin.install "zbx-#{os}-#{arch}" => "zbx"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zb --version")
    assert_match "zbx <formula>", shell_output("#{bin}/zbx 2>&1", 1)
  end
end
