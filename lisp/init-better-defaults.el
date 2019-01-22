(setq ring-bell-function 'ignore) ;; 关掉移动到顶部以及移动到底部的声音
(global-auto-revert-mode t) ;; 自动重新加载配置文件
(global-display-line-numbers-mode t) ;; 显示行号
(delete-selection-mode t) ;; 开启选中替换功能

;; 禁止自动保存
(setq auto-save-default nil)
(setq make-backup-files nil) ;; 禁止生成备份文件

(setq enable-recursive-minibuffers t)
;; 打开历史文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;;;;;; ***钩子函数配置*** ;;;;;;
(add-hook `emacs-lisp-mode-hook `show-paren-mode) ;; 添加左右括号匹配
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'after-init-hook 'global-company-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; 添加自动对齐括号
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
  	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented buffer."))
      (progn
        (indent-buffer)
	(message "Indent buffer .")))))



;; 启用自动补全的功能
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; 使用第一个字符串替换第二个字符串
					    ("ms" "Mocrosoft ")
					    ))

(provide 'init-better-defaults)
