(tool-bar-mode -1 ) ;; 关闭工具栏
(scroll-bar-mode -1) ;; 关闭滚动条
(global-hl-line-mode t) ;; 当前行高亮

(setq inhibit-splash-screen t) ;; 关闭启动欢迎画面

(setq-default cursor-type `bar) ;; 设置光标样式

(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 以全屏模式打开


(provide 'init-ui)
