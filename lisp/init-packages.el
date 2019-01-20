
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

			   popwin
			   
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
(require `hungry-delete)
(global-hungry-delete-mode)

;; 配置smartparens
(require 'smartparens-config)
(smartparens-global-mode t) ;; 全局smartparens

;; 配置nodejs-repl
(require 'nodejs-repl)

(require 'popwin)
(popwin-mode 1)

;; swiper 配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t);;;;;; ***配置默认打开文件方式*** ;;;;;;;

(setq auto-mode-alist (append `(("\\.js\\'" . js2-mode)) auto-mode-alist))

(global-company-mode t) ;; 打开全局自动补全


;;;;;; ***加载插件相关*** ;;;;;;
(load-theme `monokai t) ;; 加载monokai主题

(provide 'init-packages)
