;; init.el
;;
;; Trigger loading of Aquamacs Emacs Starter Kit customizations, etc.
;; Inspired by http://github.com/technomancy/emacs-starter-kit/.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; set the dotfiles-dir variable to this directory
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; set up our various directories to load
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Load up ELPA, the package manager

;(require 'package)
;(package-initialize)
;(require 'starter-kit-elpa)

;;;;; Vendor libs

;; general coding/editing niceties
(require 'line-num)
(require 'whitespace)

;; Additional Modes
(require 'yaml-mode)                                                                                                        
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Mac OS X/iPhone oriented, thanks http://github.com/topfunky/emacs-starter-kit/topfunky.el
;; Applescript
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(setq auto-mode-alist
      (cons '("\\.applescript$" . applescript-mode) auto-mode-alist))
;; xcode/cocoa specific
(require 'objc-c-mode)
(require 'xcode)
(define-key objc-mode-map [(meta r)] 'xcode-compile)
(define-key objc-mode-map [(meta K)] 'xcode-clean)
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  [(meta O)] 'ff-find-other-file)))
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)
            (hs-minor-mode t)))         ; Hide and show blocks

;;;;; end Vendor libs

;;;;; Aquamacs Emacs Starter Kit specific customizations
(require 'adjust-path)
(require 'misc-mode-tweaks)
(require 'prefer-utf)
(require 'override-aquamacs-to-be-more-emacsy)

;;;;; end Aquamacs Emacs Starter Kit specific customizations
