# Useful Scripts

My collection of [Bash](https://www.gnu.org/software/bash/) scripts for [OS X](https://www.apple.com/osx/) with [Homebrew](http://brew.sh). Most are simply wrappers around other utilities with the appropriate options set for my use-case. However, some such as [avi-merge.sh](avi-merge.sh) are slightly more complicated.

## Scripts

* [avi-merge.sh](avi-merge.sh) - Merge two or more AVI files into one
* [beer.sh](beer.sh) - Update [Homebrew](http://brew.sh) and optionally cleanup
* [carbon-copy.sh](carbon-copy.sh) - Create backups or copies of disks
* [img-anonymise.sh](img-anonymise.sh) - Remove personally identifiable information from images
* [secure-erase.sh](secure-erase.sh) - Secure disk erase

## Setup

```bash
git clone git@github.com:robhardwick/scripts.git ~/Documents/scripts
echo 'PATH="$HOME/Documents/scripts:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

The steps above do the following:

1. Clone the repository (we use the `Documents` directory, feel free to change all instances of `/Documents` if you would like to use somewhere different under `$HOME`, i.e. another place under your home directory)
2. Add the repository to your `$PATH` so the scripts above are available everywhere in [Bash](https://www.gnu.org/software/bash/)
3. Reload your [Bash](https://www.gnu.org/software/bash/) configuration

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
