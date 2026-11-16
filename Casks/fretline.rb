cask "fretline" do
  version "0.4.0"
  sha256 "61a4f4fa1dbe24e195a1a6462f5b2a73b99d31f03ca7c9600f5a634d1e2ddf7d"

  url "https://github.com/rbc33/Fretline/releases/download/v#{version}/Fretline-#{version}.dmg"
  name "Fretline"
  desc "Guitar tab player with Guitar Pro import and YouTube sync"
  homepage "https://github.com/rbc33/Fretline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Fretline.app"

  # Fretline está firmada ad-hoc (sin Developer ID): se quita la cuarentena
  # para que macOS la abra sin el aviso de «desarrollador no identificado».
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Fretline.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.rbc33.fretline",
    "~/Library/Containers/com.rbc33.fretline",
  ]
end
