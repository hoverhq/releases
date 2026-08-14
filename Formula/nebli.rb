# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# neblihq/homebrew-hover:Formula/nebli.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap neblihq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.nebli.ai/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Nebli < Formula
  desc "Drone relay CLI for Nebli"
  homepage "https://nebli.ai"
  version "0.1.295"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "39eafc407db00ab35e3933e7ad606a8f2d1c6fea90b0f212db15e69ac5c2ffe4"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "bdeaba4b98660311c5ce50969a9f63b3b6b9d7229643673ed3f5c46816282df7"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "d91e5517f6e03126b18649f4a53ce029cfeb2870cc10c7cc319acb4c372a8ce7"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "ad9149c5e0be8c4f388f7f1898e2bab956f075a8b670d63d624739ee6d2bc3f6"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
