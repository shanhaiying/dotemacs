
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; Box
(global-font-lock-mode 1)
(setq-default cursor-type 'box)


;; Support for more advanced HTML editing
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Show path of file in titlebar
(setq-default frame-title-format "%b (%f)")

;; Autocomplete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)

(require 'auto-complete-clang)
(defun ac-cc-mode-setup ()
 ;; (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang))
  (ac-clang-launch-completion-process)
)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Saner defaults for Emacs
(require 'graphene)
;;(setq graphene-errors-auto nil)
;; Loads ESS; use M-x R to start R shell
(require 'ess-site)
;; Loads magit; use M-x magit-status
(require 'magit)

;; Smartscan, jump between instances of symbol at cursor
;; use M-n M-p to jump forward/backward
(require 'smartscan)
(global-smartscan-mode 1)

;; Pop up dash at point
(require 'dash-at-point)
(global-set-key "\C-cd" 'dash-at-point)

;; Undo/redo (C-/, M-/, C-x u, C-u, C-S-u)
(require 'undo-tree)
(global-undo-tree-mode)

;; Current line highlighting
(require 'hl-line)
(global-hl-line-mode)

;; Anzu: enhances isearch
(require 'anzu)
(global-anzu-mode)


;; Add some custom key-binding for Mac OS X
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-[") 'previous-buffer)
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "s-r") 'replace-string)
(global-set-key (kbd "s-.") 'imenu-anywhere)
(global-set-key (kbd "s-\\") 'magit-status)
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s-_") 'text-scale-decrease)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "s-F") 'anything-occur)
(global-set-key (kbd "s-X") 'smex)

;; Start server to use emacs GUI from command line
(server-start)

;; Use js2-mode as default javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)

(defvar js2-my-global-externs '("it" "loadFixtures" "expect" "describe" "beforeEach" "spyOn" "jasmine"
                            "$" "$j" "Mustache" "jQuery" "_" "qcloud" "Nulogy" "qc" "Backbone" "JST"
                            "afterEach" "setFixtures" "require" "Handlebars" "exports" "todo" "setTimeout"
                            "clearTimeout" "setInterval" "clearInterval" "runs" "waits" "module" "Marionette"
                            "Ember" "angular" "process" "__dirname" "define" "sinon" "before" "after" "chai"
                            "moment" "location"))
(require 'ac-js2)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Pretty-symbols
;;(require 'pretty-symbols)
;;(add-hook 'js2-mode-hook 'pretty-symbols-mode)
;;(add-hook 'elpy-mode-hook 'pretty-symbols-mode)

;; Activate tramp; C-x C-f /ssh:user@server etc.
(require 'tramp)

(package-initialize)

;; Enables python mode
(elpy-enable)
;; Uses ipython as shell. C-c C-z to switch to shell; C-c C-c to run current file
(elpy-use-ipython)

;; Enable EIN; M-x notebook-list
(require 'ein)
(setq ein:use-auto-complete 't)

;; Projectile; use together with project-persist (C-c P f)
(require 'projectile)
(projectile-global-mode)

;; Recentf; use with C-x f
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'anything-recentf)

;; Enables scrollbar
(if (display-graphic-p)
(scroll-bar-mode))

;; Enables shift-arrow moving between windows
(windmove-default-keybindings)

;; Powerline
;;(require 'powerline)
(require 'cl)
;;(powerline-vim-theme)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Scroll window under mouse
(setq mouse-wheel-follow-mouse 't)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups"))))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "543976df2de12eb2ac235c79c7bc1dac6c58f4a34ae6f72237d6e70d8384f37a" "86f4407f65d848ccdbbbf7384de75ba320d26ccecd719d50239f2c36bec18628" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "7dd17c354cfb6b46a70eeb19e1e64f8bdaec474c64f890617b6e76f0d8665514" "9873d7793e0449ed30b78358a81d8219622aabf9df4492c22e08b247751ade5c" "30f861ee9dc270afc2a9962c05e02d600c998905433c8b9211dc2b33caa97c51" "65ae93029a583d69a3781b26044601e85e2d32be8f525988e196ba2cb644ce6a" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "8eef22cd6c122530722104b7c82bc8cdbb690a4ccdd95c5ceec4f3efa5d654f5" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "ce8998464858cd579515f35dd9c582f03e14175d898f67ace69f6a6c5624ed68" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "70fecb7e435889b7d0df23246b4c94343b7ed03bca0367e8e50787a8f85866d7" "5a1a016301ecf6874804aef2df36ca8b957443b868049d35043a02a0c1368517" "821af11eb274545d40c3a6cd5a43f37099e720889c39e398e5e4b0c84648d398" default)))
 '(fci-rule-color "#c7c7c7")
 '(flycheck-check-syntax-automatically (quote (save new-line mode-enabled)))
 '(flycheck-clang-include-path (quote ("/opt/local/include")))
 '(flycheck-highlighting-mode (quote lines))
 '(frame-brackground-mode (quote dark))
 '(graphene-default-font "Menlo-16")
 '(graphene-errors-auto nil)
 '(graphene-variable-pitch-font "Lucida Grande-12")
 '(js2-global-externs js2-my-global-externs)
 '(org-agenda-files (quote ("~/Projects/Plans/plans.org")))
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(pretty-symbol-patterns (quote ((955 lambda "\\<lambda\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode python-mode inferior-python-mode)) (402 lambda "\\<function\\>" (js-mode j2-mode)) (8800 relational "!=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode)) (8800 relational "/=" (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)) (8805 relational ">=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)) (8804 relational "<=" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)) (8743 logical "&&" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode)) (8743 logical "\\<and\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)) (8744 logical "||" (c-mode c++-mode go-mode java-mode js-mode perl-mode cperl-mode ruby-mode python-mode inferior-python-mode)) (8744 logical "\\<or\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)) (172 logical "\\<not\\>" (emacs-lisp-mode inferior-lisp-mode lisp-mode scheme-mode)))))
 '(safe-local-variable-values (quote ((eval if (fboundp (quote pretty-symbols-mode)) (pretty-symbols-mode -1)))))
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-color-map (quote ((20 . "#437c7c") (40 . "#336c6c") (60 . "#205070") (80 . "#2f4070") (100 . "#1f3060") (120 . "#0f2050") (140 . "#a080a0") (160 . "#806080") (180 . "#704d70") (200 . "#603a60") (220 . "#502750") (240 . "#401440") (260 . "#6c1f1c") (280 . "#935f5c") (300 . "#834744") (320 . "#732f2c") (340 . "#6b400c") (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:inherit mode-line :background "gray30" :foreground "DodgerBlue3" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(mode-line ((t (:background "gray73" :foreground "gray0" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "black" :weight bold))))
 '(mode-line-highlight ((t (:foreground "gray0" :box (:line-width 2 :color "grey75" :style released-button) :weight bold))))
 '(powerline-active1 ((t (:inherit mode-line :background "gray60"))))
 '(powerline-active2 ((t (:inherit mode-line :background "gray60")))))
