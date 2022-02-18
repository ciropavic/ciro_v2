# How to setup HTML+JS
## Setting up the pins
1. Use the generator to create the code.
    - Paste the coordinates in an x, y, z format `0, 0, 0`
    - Choose the name and description of the spawn location
    - Pin & selected pin values represent the ID of preloaded pin images (More of that later)
    - Image name represents the name of the image file that will be used to represent the location. (Put the files in `images/` )
2. Using custom pins
    - Each coordinate can have a custom pin style and selected style
    - In order to use custom styles please create a new `<img>` in `index.html` at the specified location.
        - Make sure the img has a class `class="icons"`
        - Also make sure you set an ID for the image
        - *Usually put new icons in pairs for selected/not selected icons*
    - In the generator use the ID's for pins that you just set

Paste generated data into mapdata.js