# Useful Scripts

Useful [Bash](https://www.gnu.org/software/bash/) scripts for use on OS X with [Homebrew](http://brew.sh). Most of these are simply wrappers around other utilities with the appropriate options set for my use-case.

## Scripts

* [avi-merge.sh](avi-merge.sh) - Merge two or more AVI files into one
* [beer.sh](beer.sh) - Update [Homebrew](http://brew.sh) and optionally cleanup
* [carbon-copy.sh](carbon-copy.sh) - Create a backup of a disk
* [img-anonymise.sh](img-anonymise.sh) - Remove personally identifiable information from images

## Setup

```bash
git clone git@github.com:robhardwick/scripts.git ~/Documents/scripts
echo 'export PATH="~/Documents/scripts:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

## License

    Copyright (C) 2016 Rob Hardwick

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
    associated documentation files (the "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
    LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
    EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
