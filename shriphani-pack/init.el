;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(live-set-default-font "Consolas 11")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-hook 'cuda-mode-hook 'my-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))

(defun get-default-height ()
       (/ (- (display-pixel-height) 120)
          (frame-char-height)))

(add-to-list 'default-frame-alist '(width . 140))
(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

(add-hook 'cuda-mode-hook
          'c++-mode)

(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'cuda-mode "\\.cu\\'" 'c++-mode)
