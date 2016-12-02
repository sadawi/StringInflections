Pod::Spec.new do |s|
    s.name              = 'StringInflections'
    s.version           = '0.0.4'
    s.summary           = 'Methods to pluralize, singularize, camelcase, and underscore strings'
    s.homepage          = 'https://github.com/sadawi/StringInflections'
    s.license           = { :type => 'MIT' }
    s.author            = { 'Sam Williams' => 'samuel.williams@gmail.com' }
    s.source            = { :git => 'https://github.com/sadawi/StringInflections.git', :tag => s.version.to_s }
    s.platforms         = { :ios => '9.0' }
    s.requires_arc      = true
    s.source_files      = 'StringInflections/**/*'
end
