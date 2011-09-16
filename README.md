Iconic: http://somerandomdude.com/projects/iconic/
CSS Sprite Generator: http://spritegen.website-performance.org/

The Iconic download package looks like:

    font/
    raster/
      color/
        file_8x8.png
        file_12x12.png
        file_16x16.png
        file_24x24.png
        file_32x32.png
        ...
    swc/
    vector/

In order to generate a single image for CSS sprites, we need to organize
the files into separate folders based on their size.

Running organize.rb will create a new `bysize` directory and organize each
color's files into separate directories by size:

    /bysize
        /color
            8x8/
                file1.png
                file2.png
                ...
            12x12/
                ...
            16x16/
                ...
            24x24
                ...
            32x32
                ...
                
Finally, it will zip up each size directory, ready to be uploaded to the CSS
Sprite Generator site.