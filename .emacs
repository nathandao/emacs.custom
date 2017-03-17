;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(add-to-list 'package-archives '("melpa" .  "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
 '(package-selected-packages
   (quote
    (bash-completion moe-theme ample-theme evil-avy el-get neotree cider rainbow-delimiters helm-projectile projectile undo-tree elisp-format helm nyan-mode cyberpunk-theme clojure-mode chess yasnippet yaml-mode whitespace-cleanup-mode typescript-mode tree-mode smartparens paredit nrepl-sync nrepl-eval-sexp-fu multiple-cursors markdown-mode magit-popup magit lispy jsx-mode ivy inflections hydra highlight-chars highlight haskell-mode haskell-emacs git-commit fill-column-indicator es-windows es-lib emmet-mode edn dash company cljr-helm clj-refactor buffer-utils align-cljlet ace-window)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Global

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-20170111.1838/")
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20170111.1838/")
(require 'moe-theme)
(moe-dark)
(evil-mode)
(ido-mode)
(global-hl-line-mode t)

(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
(setq-default nyan-animate-nyancat t)
(setq-default nyan-bar-length 40)

(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)

(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
;;    apropos-do-all t
;;    mouse-yank-at-point t
      require-final-newline t
      visible-bell t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(desktop-save-mode 1)
(setq-default show-trailing-whitespace t)
(setq max-lisp-eval-depth 10000)

(setq-default line-spacing 2)
(setq-default css-indent-offset 2)

(add-hook 'after-init-hook 'global-company-mode)
(setq-default company--auto-completion t)

(defvar temp-file-directory "~/emacs-temple"
  "Temporary directory for auto-save backup files")
(setq backup-directory-alist `((".*" . ,temp-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temp-file-directory t)))

(setq-default fci-rule-color "#bada55")
(defun prog-ocd-hooks ()
  (rainbow-delimiters-mode t)
  (fci-mode t)
  (smartparens-mode t)
  (linum-mode t)
  (undo-tree-mode t))

(add-hook 'prog-mode-hook 'prog-ocd-hooks)

;; Auto closing parens
;; (setq skeleton-pair t)
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)

;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)

;; Helm
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(setq helm-M-x-fuzzy-match                  t helm-bookmark-show-location           t
      helm-buffers-fuzzy-matching           t helm-completion-in-region-fuzzy-match t
      helm-file-cache-fuzzy-match           t helm-imenu-fuzzy-match                t
      helm-mode-fuzzy-match                 t helm-locate-fuzzy-match               t
      helm-quick-update                     t helm-recentf-fuzzy-match              t
      helm-semantic-fuzzy-match             t)

;; Projectile
(helm-projectile-on)
(setq projectile-use-git-grep t)

(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
(global-set-key (kbd "C-c p s g") 'helm-projectile-grep)

;; Neo tree
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
	(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir (if (neo-global--window-exists-p)
			(progn (neotree-dir project-dir)
			       (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key (kbd "C-c f t") 'neotree-project-dir)

;; Clojure
(global-set-key (kbd "C-c a l") 'align-cljlet)

(setq cider-cljs-lein-repl "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

(setq cider-cljs-boot-repl "(do (def p (future (boot (dev)))))")
