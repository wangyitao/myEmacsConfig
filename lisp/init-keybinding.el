;; C-k 删除光标后面的字符，C-a 回到句首 C-e 回到句尾 C-d 删除当前字符
;; C-w 删除前一个单词,C-l 删除整行
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-l") 'kill-whole-line)
;; 绑定三个常用的函数
(global-set-key (kbd "C-h C-f") `find-function)
(global-set-key (kbd "C-h C-v") `find-variable)
(global-set-key (kbd "C-h C-k") `find-function-on-key)

(global-set-key "\C-x\ \C-r" `recentf-open-files)


;; 定制打开配置n文件的快捷键
(global-set-key (kbd "<f11>") `open-my-init-file)


;; swiper 配置
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


(global-set-key (kbd "C-c p f") 'counsel-git) ;; 从本地git仓库查找文件

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer) ;; 自动对齐括号

(global-set-key (kbd "C-/") 'hippie-expand) ;; 在company无法补全时自动补全

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(global-set-key (kbd "M-s o") 'occur-dwim)


(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s e") 'iedit-mode)


(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(global-set-key (kbd "C-c r") 'org-capture) ;; 打开org工作安排

(global-set-key (kbd "M-s e") 'iedit-mode)

;; 更改代码补全配置
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root) ;; 过滤比grep块

(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(provide 'init-keybinding)
