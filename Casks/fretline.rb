cask "fretline" do
  version "0.1.0"
  sha256 "b426fc8ba7229ad0e1ee1acb9a125aeb8940e98472218ab01ae92429703e4f6c"

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
