
;;;;;; ***配置下载软件包*** ;;;;;;
(when (>= emacs-major-version 24)
  (require `package)
  (add-to-list `package-archives `("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  )

(require `cl)

(defvar felix/packages `(
			 company ;; 代码补全
			 
			 monokai-theme ;; monokai主题
			 hungry-delete ;; 一下子删掉多个空格
			 swiper ;; 搜索之类的提示
			 counsel ;; 有了这个可以替换掉smex
			 smartparens ;; 左右括号不全

			 ;; javascript
			 js2-mode
			 nodejs-repl

			 popwin

			 web-mode
			 js2-refactor
			 expand-region

			 iedit

			 org-pomodoro
			 helm-ag
			 flycheck
			 yasnippet-snippets
			 yasnippet
			 auto-yasnippet
			 evil
			 evil-leader
			 ) "Default packages")

(setq package-selected-packages felix/packages)

(defun felix/packages-installed-p ()
  (loop for pkg in felix/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))
(unless (felix/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg felix/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 加载hungry-delete插件
(global-hungry-delete-mode)

;; 配置smartparens
(smartparens-global-mode t) ;; 全局smartparens
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil) ;; 当在lisp-mode下输入单引号的时候取消补全

;; 配置nodejs-repl
(require 'nodejs-repl)
(require 'org-pomodoro)

(require 'popwin)
(popwin-mode 1)

;; swiper 配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t);;;;;; ***配置默认打开文件方式*** ;;;;;;;

(setq auto-mode-alist (append `(
				("\\.js\\'" . js2-mode)
				("\\.html\\'" . web-mode)
				) auto-mode-alist))

(global-company-mode t) ;; 打开全局自动补全


;;;;;; ***加载插件相关*** ;;;;;;
(load-theme `monokai t) ;; 加载monokai主题


;; 配置web-mode
;; 配置空格缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 配置两个空格和四个空格之间切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

;; 配置js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; (global-flycheck-mode t) ;; 全局语法检查
(global-evil-leader-mode) 

(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  )
(provide 'init-packages)
