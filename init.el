;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;;;;; ***配置下载软件包*** ;;;;;;
(when (>= emacs-major-version 24)
  (require `package)
  (package-initialize)
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;  ***基本工具配置*** ;;;;;;

(tool-bar-mode -1 ) ;; 关闭工具栏
(scroll-bar-mode -1) ;; 关闭滚动条
(global-hl-line-mode t) ;; 当前行高亮

;; 绑定三个常用的函数
(global-set-key (kbd "C-h C-f") `find-function)
(global-set-key (kbd "C-h C-v") `find-variable)
(global-set-key (kbd "C-h C-k") `find-function-on-key)

(setq inhibit-splash-screen t) ;; 关闭启动欢迎画面

(global-display-line-numbers-mode t) ;; 显示行号
(delete-selection-mode t) ;; 开启选中替换功能

(setq-default cursor-type `bar) ;; 设置光标样式
(setq make-backup-files nil) ;; 禁止生成备份文件

(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 以全屏模式打开
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; ***模式配置*** ;;;;;;

;; 配置org-mode 语法高亮
(require `org)
(setq org-src-fontify-natively t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; *** 快捷键相关配置*** ;;;;;;

;; 配置a打开历史文件
(require `recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" `recentf-open-files)


;; 定制打开配置n文件的快捷键
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f11>") `open-my-init-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;; ***钩子函数配置*** ;;;;;;

(add-hook `emacs-lisp-mode-hook `show-paren-mode) ;; 添加左右括号匹配
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'after-init-hook 'global-company-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;; ***加载插件相关*** ;;;;;;
(load-theme `monokai t) ;; 加载monokai主题

;; 加载hungry-delete插件
(require `hungry-delete)
(global-hungry-delete-mode)

;; swiper 配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; 配置smartparens
(require 'smartparens-config)
(smartparens-global-mode t) ;; 全局smartparens

;; 配置nodejs-repl
(require 'nodejs-repl)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;; ***配置默认打开文件方式*** ;;;;;;;

(setq auto-mode-alist (append `(("\\.js\\'" . js2-mode)) auto-mode-alist))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(cua-mode t nil (cua-base))
 '(global-display-line-numbers-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

