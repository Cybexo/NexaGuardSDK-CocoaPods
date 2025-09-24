Pod::Spec.new do |s|
  # ---- Identity -----------------------------------------------------------
  s.name             = 'NexaGuardSDK'            # <- what devs put in Podfile
  s.version          = '1.0.24'
  s.summary          = 'IAB-TCF-compliant consent SDK for iOS'
  s.description      = <<-DESC
    NexaGuardSDK provides a drop-in CMP banner, second-layer, and storage
    disclosure UI. Fully Swift, no tracking, works offline, supports
    TCF v2/GPP strings and custom vendor lists.
  DESC
  s.homepage         = 'https://www.nexaguard.com'
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { 'NexaGuard' => 'ios@nexaguard.com' }
  s.source           = { :git => 'https://github.com/NexaGuard/NexaGuardSDK-CocoaPods.git',
                         :tag => s.version.to_s }
  s.documentation_url = 'https://developer.nexaguard.com/'

  # ---- Platform / Swift ----------------------------------------------------
  s.ios.deployment_target = '13.0'
  s.swift_version         = '5.10'

  # ---- Build settings ------------------------------------------------------
  # s.source_files = ''
  # s.public_header_files = 'cmp/cmp/NexaGuardSDK.h'

    # The binary lives in the repo root
  s.vendored_frameworks = 'NexaGuardSDK.xcframework'

  # We don’t use resources inside the framework yet; if you add Lottie JSON,
  # images, etc. later:
  # s.resource_bundles = { 'NexaGuardSDK' => ['cmp/Resources/**/*'] }

  # ---- Dependencies --------------------------------------------------------
  # (none for now – UIKit & Foundation only)
  # Example: s.dependency 'Alamofire', '~> 5.9'

  # ---- SwiftPM-like linkage tweaks (optional) ------------------------------
  s.frameworks = 'UIKit', 'WebKit'
end

