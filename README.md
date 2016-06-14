# Overview

Implementation of the algorithm described in http://rodrigouroz.github.io/2016/06/13/hiding-things-at-plain-sight/.

Uses [`chunky_png`](https://github.com/wvanbergen/chunky_png) to read each pixel's
RGB data from the source PNG file.

# Usage

```sh
bundle install
bundle exec ruby decode.rb amsterdam.png
```
