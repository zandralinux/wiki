# Zandra Package Management Guide

```
# install foo
searchpkg '^foo#' | fetchpkg
installpkg foo#1.0.pkg.tgz # replace with actual version

# remove foo
removepkg foo
```

You can remove packages by running removepkg foo.
