(set-language-environment "UTF-8") ;; 设置emacs编码语言为utf8
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
;; 显示所在位置的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))
(add-hook `emacs-lisp-mode-hook `show-paren-mode) ;; 添加左右括号匹配
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'js2-mode-hook 'flycheck-mode) ;; 添加语法检查钩子，这个是为js2mode添加语法检查

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode) ;; 代码块补全

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

;; 增强hippie补全效果
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))
(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwin-target 1) ;; 可以使当一个窗口（frame）中存在两个分屏 （window）时，将另一个分屏自动设置成拷贝地址的目标。

;; 替换dos下面的换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 增强occor-mode
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))


;; 添加imenu扩展
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
        ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
        (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
              (lambda ()
                (setq imenu-create-index-function 'js2-imenu-make-index)))



(provide 'init-better-defaults)

