require 'pathname'
require 'fileutils'

filenames = %w[
  src/_pages/404.md
  src/_pages/500.md
  src/_pages/contact/index.de.md
  src/_pages/contact/index.en.md
  src/_pages/index.de.erb
  src/_pages/index.en.erb
  src/_pages/products/index.de.md
  src/_pages/products/index.en.md
  src/_pages/sap/index.de.md
  src/_pages/sap/index.en.md
  src/_pages/web-and-infrastructure/index.de.md
  src/_pages/web-and-infrastructure/index.en.md
]

filenames.each do |filename|
  pathname = Pathname.new(filename)

  dir, basename = pathname.split

  unless dir.directory?
    FileUtils.mkdir_p dir
  end

  unless basename.file?
    File.open(pathname, 'w') do |file|
      2.times { file.write "---\n" }
    end
  end
end
