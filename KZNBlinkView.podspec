Pod::Spec.new do |s|

  s.name         = "KZNBlinkView"
  s.version      = "0.1"
  s.summary      = "Category of UIView to blink."
  s.description  = <<-DESC
                   A longer description of KZNBlinkView in Markdown format.

                   * KZNBlinkView is UIView to blink.
                   * KZNBlinkView is tested on iOS 5.0+ and requires ARC.
                   DESC
  s.homepage     = "http://kenzan8000.org"
  s.license      = { :type => 'MIT' }
  s.author       = { "Kenzan Hase" => "kenzan8000@gmail.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/kenzan8000/KZNBlinkView.git", :tag => "v0.1" }
  s.source_files  = 'KZNBlinkView/*.{h,m}'
  # s.exclude_files = 'Classes/Exclude'
  # s.public_header_files = 'Classes/**/*.h'
end
