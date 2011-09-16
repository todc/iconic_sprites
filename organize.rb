basedir = "/Users/timo/Downloads/iconic/raster"
todir   = "/Users/timo/Downloads/iconic/bysize"
sizes = ['8x8','12x12','16x16','24x24','32x32']
colors = [
  'black','blue','brown_dark','brown_light','cyan','gray_dark','gray_light',
  'green','magenta','orange','red','tan','white','yellow'
]


# create bysize directories
colors.each do |c|
  sizes.each do |s|
    `mkdir -p #{todir}/#{c}/#{s}`
  end
end


colors.each do |c|
  dir_contents = Dir.entries("#{basedir}/#{c}")
  
  puts ""
  puts "---"
  puts "--- #{c.upcase}"
  puts "---"

  dir_contents.each do |f|
    matches = /(\w+)_(\d+)x(\d+).png/.match(f) 
    if matches
    
      h = matches[2].to_i
      w = matches[3].to_i
    
      if h <= 8 and w <= 8
        size_dir = '8x8'
      elsif h <= 12 and w <= 12
        size_dir = '12x12'
      elsif h <= 16 and w <= 16
        size_dir = '16x16'
      elsif h <= 24 and w <= 24
        size_dir = '24x24'
      else
        size_dir = '32x32'
      end
    
      puts "#{size_dir} = #{f}"

      `cp #{basedir}/#{c}/#{f} #{todir}/#{c}/#{size_dir}/#{matches[1]}.png` 
    end

  end

  sizes.each do |s|
    puts "Zipping #{s}..."
    `zip #{todir}/#{c}/#{s}.zip #{todir}/#{c}/#{s}/*`
  end
  
end
