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

(provide 'init-keybinding)
