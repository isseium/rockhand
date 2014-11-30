Rockhand
==============

# Overview

Rock hand is utilities for titanium developers.

There is some useful scripts.

For example, 
    - Icon Generator: generate many icons from one icon
    - Splash Generator: generate many splash pictures from one pictures
And more...

This project is trial project. 
We aim to merge and contribute for titanium official project in the future.

# How to use

## Icon Generator
```
$ ./rockhand icon images/appicon-1024.png ~/repos/TiSample
generating...  width=120        height=120      filename=/Users/issei/repos/TiSample/app/assets/iphone/appicon-60@2x.png
generating...  width=76         height=76       filename=/Users/issei/repos/TiSample/app/assets/iphone/appicon-76.png
generating...  width=152        height=152      filename=/Users/issei/repos/TiSample/app/assets/iphone/appicon-76@2x.png
:
:
```

## Splash Generator

```
./rockhand splash -b "#00FF00" images/default.png ~/repos/TiSample
generating...  width=320        height=480      filename=/Users/issei/repos/TiSample/app/assets/iphone/Default.png      depth=72
generating...  width=640        height=960      filename=/Users/issei/repos/TiSample/app/assets/iphone/Default@2x.png   depth=72
generating...  width=640        height=960      filename=/Users/issei/repos/TiSample/app/assets/iphone/Default@2x.png   depth=72
:
:
```

# Contributing
This project is open source project.
Please consider forking this repo to improve, enhance or fix issues. If you feel like the community will benefit from your fork, please open a pull request.

# License
This project is open source and provided under the Apache Public License (version 2). Please make sure you see the LICENSE file included in this distribution for more details on the license. Also, please take notice of the privacy notice at the end of the file.

Copyright (C) 2014, [@isseium](http://twitter.com/isseium) at Cheekit, Inc. , All rights reserved.
