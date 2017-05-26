(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(setq sml/theme 'light)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (smart-mode-line-respectful)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (color-theme-solarized neotree smart-mode-line powerline use-package helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Git interface
(use-package magit)

;; VIM IN EMACS
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; More configuration goes here
  )

; Solariazed Configurations
(load-theme 'solarized t)
(set-terminal-parameter nil 'background-mode 'dark)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

; Mode Line configurations to make powerliner better
(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup)

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme)
)
;; Set Powerline Configuration
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
)

; https://www.emacswiki.org/emacs/NeoTree
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-smart-open t)
)
<<<<<<< HEAD
;; Set Powerline Configuration
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))

;; Projectile
(add-hook 'python-mode-hook 'projectile-mode)

;; rebind neotree in evil-mode
=======
>>>>>>> 0c4d4a216c50c05346f138e4c5e8e73ac8f4c81a
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

;; Jedi - Python autocomplete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)  
(add-hook 'python-mode-hook 'jedi:setup)

;; Virtualenv stuff
;; https://github.com/porterjamesj/virtualenvwrapper.el
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support

;; Projectile and Virtualenv
(setq projectile-switch-project-action 'venv-projectile-auto-workon)
(setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))

;; keybindings
;; Magit!
(global-set-key (kbd "C-x g") 'magit-status)
;; buffer list
(global-set-key (kbd "C-x C-l") 'list-buffers)
(set-terminal-parameter nil 'background-mode 'dark)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized-dark)))