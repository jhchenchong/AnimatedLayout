Pod::Spec.new do |s|
s.name = 'AnimatedLayout'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = 'An animatedLayout of UICollectionView'
s.homepage = 'https://github.com/jhchenchong/AnimatedLayout'
s.authors = { '浪漫恋星空' => '727378500@qq.com' }
s.source = { :git => 'https://github.com/jhchenchong/AnimatedLayout.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'AnimatedLayout/AnimatedLayout/AnimatedLayout/*.{h,m}'
end
