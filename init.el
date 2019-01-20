;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(add-to-list `load-path "~/.emacs.d/lisp/")
(require `init-packages)

(setq ring-bell-function 'ignore) ;; 关掉移动到顶部以及移动到底部的声音

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;  ***基本工具配置*** ;;;;;;

(tool-bar-mode -1 ) ;; 关闭工具栏
(scroll-bar-mode -1) ;; 关闭滚动条
(global-hl-line-mode t) ;; 当前行高亮
(global-auto-revert-mode t) ;; 自动重新加载配置文件

;; 绑定三个常用的函数
(global-set-key (kbd "C-h C-f") `find-function)
(global-set-key (kbd "C-h C-v") `find-variable)
(global-set-key (kbd "C-h C-k") `find-function-on-key)

(setq inhibit-splash-screen t) ;; 关闭启动欢迎画面

;; 禁止自动保存
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-display-line-numbers-mode t) ;; 显示行号
(delete-selection-mode t) ;; 开启选中替换功能

(setq-default cursor-type `bar) ;; 设置光标样式
(setq make-backup-files nil) ;; 禁止生成备份文件

(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 以全屏模式打开

;; 启用自动补全的功能
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; 使用第一个字符串替换第二个字符串
					    ("ms" "Mocrosoft ")
					    ))

;; 配置org-mode 语法高亮
(require `org)
(setq org-src-fontify-natively t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; ***模式配置*** ;;;;;;



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



;; swiper 配置

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




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

