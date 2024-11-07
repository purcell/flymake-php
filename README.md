flymake-php.el
==============

An Emacs flymake handler for syntax-checking PHP source code.

Installation
=============

If you choose not to use one of the convenient packages in
[Melpa][melpa] and [Marmalade][marmalade], you'll need to add the
directory containing `flymake-php.el` to your `load-path`, and then
`(require 'flymake-php)`. You'll also need to install
[flymake-easy](https://github.com/purcell/flymake-easy).

Usage
=====

Add the following to your emacs init file:

    (require 'flymake-php)
    (add-hook 'php-mode-hook 'flymake-php-load)

[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.org

<hr>

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)

