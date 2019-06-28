;; installed packages.  Don't delete this line.  If you don't want it,;
;; Added by Package.el.  This must come before configurations of
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;(add-to-list 'package-archives (cons "melpa" "http://melpa.milkbox.net/packages/"))

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(evil-mode 1)
(ido-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-20170111.1838/")
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20170111.1838/")
(set-face-attribute 'default nil :font "Tlwg Mono Bold" :height 112)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-hl-line-mode t)
(column-number-mode)

(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

(fa-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(css-indent-offset 2 t)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
    ("d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "6952b5d43bbd4f1c6727ff61bc9bf5677d385e101433b78ada9c3f0e3787af06" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#383838" t)
 '(fill-column 120)
 '(gnus-logo-colors (quote ("#1ec1c4" "#bababa")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(indent-tabs-mode nil)
 '(json-reformat:pretty-string\? t)
 '(neo-show-hidden-files t)
 '(package-selected-packages
   (quote
    (wsd-mode markdown-preview-eww matlab-mode winum window-numbering go-dlv pg terraform-mode company-go go-playground-cli go-stacktracer go-projectile godoctor go-tag flymake-go exec-path-from-shell plantuml-mode flycheck-golangci-lint go-errcheck gorepl-mode window-jump window-number slime-company multi-web-mode slime javap-mode purescript-mode alect-themes projectile-codesearch projectile-ripgrep wgrep hackernews gitlab-ci-mode-flycheck gitlab-ci-mode docker-tramp docker-api dockerfile-mode svg-mode-line-themes svg elisp-lint markdown-toc prettier-js bitbucket docker-compose-mode rust-mode goto-last-change evil-indent-plus column-marker nginx-mode helm-descbinds less-css-mode writeroom-mode markdown-mode+ evil-magit flymake-google-cpplint yasnippet-snippets react-snippets go-gopath golint go-autocomplete go-complete go-guru go eldoc-extension helm-open-github tss nodejs-repl node-resolver web-mode-edit-element company-web eldoc-overlay-mode flyspell-correct-popup flyspell-correct flyspell-popup flymake-jslint flycheck-clojure js3-mode web-narrow-mode company-c-headers xml+ org-bullets caps-lock scad-mode function-args tidy web-beautify go-mode lua-mode arduino-mode web-mode tide js2-refactor js2-highlight-vars lorem-ipsum js2-mode multi-term json-mode bash-completion moe-theme ample-theme evil-avy el-get neotree rainbow-delimiters helm-projectile projectile undo-tree elisp-format helm nyan-mode cyberpunk-theme clojure-mode chess yasnippet yaml-mode whitespace-cleanup-mode typescript-mode tree-mode smartparens paredit nrepl-sync nrepl-eval-sexp-fu multiple-cursors markdown-mode magit-popup magit lispy jsx-mode ivy inflections hydra highlight-chars highlight haskell-mode haskell-emacs git-commit es-windows es-lib emmet-mode edn dash company cljr-helm clj-refactor buffer-utils align-cljlet ace-window)))
 '(purescript-mode-hook (quote (turn-on-purescript-indentation)))
 '(show-paren-mode t)
 '(sql-mysql-login-params (quote (user password server database port)))
 '(standard-indent 2)
 '(tab-width 2)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#404040")
 '(vc-annotate-color-map
   (quote
    ((20 . "#c83029")
     (40 . "#db4334")
     (60 . "#959508")
     (80 . "#bcaa00")
     (100 . "#dc7700")
     (120 . "#c9d617")
     (140 . "#319448")
     (160 . "#078607")
     (180 . "#60a060")
     (200 . "#29b029")
     (220 . "#47cd57")
     (240 . "#4c8383")
     (260 . "#1ba1a1")
     (280 . "#0a7874")
     (300 . "#1e7bda")
     (320 . "#00a2f5")
     (340 . "#58b1f3")
     (360 . "#da26ce"))))
 '(vc-annotate-very-old-color "#da26ce")
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 0)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-sql-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "medium spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "cyan")))))

;; Global

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(nyan-mode t)
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
(global-linum-mode t)

(add-hook 'after-init-hook 'global-company-mode)
(setq-default company--auto-completion t)

(global-set-key (kbd "M-o") 'ace-window)

(defvar temp-file-directory "~/emacs-temple"
  "Temporary directory for auto-save backup files")
(setq backup-directory-alist `((".*" . ,temp-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temp-file-directory t)))

(setq-default fci-rule-color "#bada55")

(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (rainbow-delimiters-mode t)
            (smartparens-mode t)
            (undo-tree-mode t)))

;; Custom indentations
(defun set-prefered-indent (prefered-indent)
  (setq-default css-indent-offset prefered-indent
                js-indent-level prefered-indent
                jsx-indent-level prefered-indent
                standard-indent prefered-indent
                web-mode-markup-indent-offset prefered-indent
                web-mode-css-indent-offset prefered-indent
                web-mode-code-indent-offset prefered-indent
                typescript-indent-level prefered-indent
                json-reformat:indent-width prefered-indent
                web-mode-sql-indent-offset prefered-indent))

(set-prefered-indent 2)

(defun my:set-web-indent ()
  (interactive)
  (set-prefered-indent
   (string-to-int (read-string "indent spaces: "))))

;; auto-complete
(require 'auto-complete)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

;; C and C++
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint-load)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load))

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

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

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "C")   'neotree-change-root)
            (define-key evil-normal-state-local-map (kbd "U")   'neotree-select-up-node)
            (define-key evil-normal-state-local-map (kbd "r")   'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "o")   'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "i")   'neotree-enter-horizontal-split)
            (define-key evil-normal-state-local-map (kbd "s")   'neotree-enter-vertical-split)
            (define-key evil-normal-state-local-map (kbd "n")   'evil-search-next)
            (define-key evil-normal-state-local-map (kbd "N")   'evil-search-previous)
            (define-key evil-normal-state-local-map (kbd "ma")  'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "mc")  'neotree-copy-file)
            (define-key evil-normal-state-local-map (kbd "md")  'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "mm")  'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "gg")  'evil-goto-first-line)))

;; (add-hook 'prog-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'wsd-mode-hook 'company-mode)

;; (setq wsd-style "napkin")
;; (setq wsd-style "qsd")
(setq wsd-style "earth")

;; org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "C")
              'org-edit-src-exit (kbd "q"))))

(defun org-remove-headlines (backend)
  "Remove headlines with :notitle: tag."
  (org-map-entries (lambda () (let ((beg (point)))
                                (outline-next-visible-heading 1)
                                (backward-char)
                                (delete-region beg (point))))
                   "noexport" tree)
  (org-map-entries (lambda () (delete-region (point-at-bol) (point-at-eol)))
                   "notitle"))

;; golang
(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook
 'go-mode-hook
 (lambda()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'go-guru-definition)
   (flycheck-mode)))

(add-hook 'org-export-before-processing-hook #'org-remove-headlines)

;; TypeScript / JS
;; (require 'flycheck)
(require 'tide)
;; (require 'web-mode)

(defun use-web-mode (lst)
  (dolist (file lst)
    (add-to-list
     'auto-mode-alist
     (cons file (lambda ()
                  (web-mode)
                  (web-mode-set-content-type "jsx")
                  (flycheck-mode +1)
                  (setq flycheck-check-syntax-automatically '(save mode-enabled))
                  ;; (eldoc-mode +1)
                  ;; (company-mode +1)
                  )))))

(use-web-mode
 (list "\\.js\\'"
       "\\.jsx\\'"
       "\\.ts\\'"
       "\\.tsx\\'"
       "\\.nunjucks\\'"
       "\\.syt\\'"))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-auto-indentation t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(add-hook
 'web-mode-hook
 (lambda ()
   (when (or (string-equal "jsx" (file-name-extension buffer-file-name))
             (string-equal "js" (file-name-extension buffer-file-name))
             (string-equal "tsx" (file-name-extension buffer-file-name))
             (string-equal "ts" (file-name-extension buffer-file-name)))
     (setup-tide-mode)
     (set-fill-column 120)
     (visual-fill-column-mode)
     (define-key evil-normal-state-local-map
       (kbd "M-.") 'tide-jump-to-definition))))

;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (eval-after-load 'web-mode
;;   '(progn
;;      (add-hook 'web-mode-hook #'add-node-modules-path)
;;      (add-hook 'web-mode-hook #'prettier-js-mode)))

;; Clojure
(setq cider-default-repl-command "lein")
(add-hook
 'cider-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'cider-find-dwim)))

(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

;; Common Lisp

(add-hook
 'slime-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map
     (kbd "M-.") 'slime-edit-definition)))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/pimpin/slime-docker/")

;; load the packaged named xyz.
(load "slime-docker") ;; best not to include the ending “.el” or “.elc”

;; Set your lisp system and, optionally, some contribs

(setq inferior-lisp-program "/usr/bin/sbcl")
;; Do some standard SLIME configuration.
(slime-setup '(slime-fancy slime-tramp))
;; Configure slime-docker to use a specific image with shared volumes
;; and correct ports exposed
(setq slime-docker-implementations `((sbcl ("sbcl")
                                           :image-name "syte/blog"
                                           :mounts ((("/home/ndao/pimpin/sytes-docker/syte.blog"
                                                      . "/usr/local/share/common-lisp/source/syte.blog")))
                                           :ports ((:host-port 7379 :container-port 7379 :ip "127.0.0.1")))))

;;
(require 'json)
(require 'flycheck)

(defun my-parse-jslinter-warning (warning)
  (flycheck-error-new
   :line (1+ (cdr (assoc 'line warning)))
   :column (1+ (cdr (assoc 'column warning)))
   :message (cdr (assoc 'message warning))
   :level 'error
   :buffer (current-buffer)
   :checker 'javascript-jslinter))

(defun jslinter-error-parser (output checker buffer)
  (mapcar 'parse-jslinter-warning
          (cdr (assoc 'warnings (aref (json-read-from-string output) 0)))))

(flycheck-define-checker javascript-jslinter
  "A JavaScript syntax and style checker based on JSLinter.

See URL `https://github.com/tensor5/JSLinter'."
  :command ("c:/Users/Felix/AppData/Roaming/npm/jslint" "--raw" source)
  :error-parser jslinter-error-parser
  :modes (json-mode))
