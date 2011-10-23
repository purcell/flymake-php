;;; flymake-php.el --- A flymake handler for php-mode files
;;
;;; Author: Steve Purcell <steve@sanityinc.com>
;;; URL: https://github.com/purcell/flymake-php
;;; Version: DEV
;;;
;;; Commentary:
;; Usage:
;;   (require 'flymake-php)
;;   (add-hook 'php-mode-hook 'flymake-php-load)
(require 'flymake)

;;; Code:

(defconst flymake-php-err-line-patterns '(("\\(?:Parse\\|Fatal\\|syntax\\) error[:,] \\(.*\\) in \\(.*\\) on line \\([0-9]+\\)" 2 3 nil 1)))

(defvar flymake-php-executable "php"
  "The php executable to use for syntax checking.")

;; Invoke php with '-f' to get syntax checking
(defun flymake-php-init ()
  "Construct a command that flymake can use to check php source."
  (list flymake-php-executable
        (list "-f" (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace) "-l")))

;;;###autoload
(defun flymake-php-load ()
  "Configure flymake mode to check the current buffer's php syntax.

This function is designed to be called in `php-mode-hook'; it
does not alter flymake's global configuration, so function
`flymake-mode' alone will not suffice."
  (interactive)
  (set (make-local-variable 'flymake-allowed-file-name-masks) '(("." flymake-php-init)))
  (set (make-local-variable 'flymake-err-line-patterns) flymake-php-err-line-patterns)
  (if (executable-find flymake-php-executable)
      (flymake-mode t)
    (message "Not enabling flymake: '%' command not found" flymake-php-executable)))


(provide 'flymake-php)
;;; flymake-php.el ends here
