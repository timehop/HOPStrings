#
# Be sure to run `pod lib lint HOPStrings.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HOPStrings"
  s.version          = "0.1.0"
  s.summary          = "A small library for making NSAttributedStrings."
  s.description      = <<-DESC
                       Set some default attributes, then chain HOPAttribute instances together to create your attributed string.
                       DESC
  s.homepage         = "https://github.com/timehop/HOPStrings"
  s.screenshots      = "https://github.com/timehop/HOPStrings/blob/master/Marketing/example_01.png"
  s.license          = 'MIT'
  s.author           = { "Chris Trott" => "chris@timehop.com" }
  s.source           = { :git => "https://github.com/timehop/HOPStrings.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/twocentstudios'

  s.platform     = :ios, '3.2'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'HOPStrings' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
