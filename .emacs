(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("47ec21abaa6642fefec1b7ace282221574c2dd7ef7715c099af5629926eb4fd7" default))
 '(org-agenda-files '("~/emacs_docs/gtdwork.org"))
 '(org-capture-templates
   '(("w" "Work templates")
     ("wt" "TODO entry" entry
      (file+headline "C:\\emacs\\emacs_docs\\gtdwork.org" "Capture")
      (file "C:\\emacs\\templates\\tpl-todo.txt")
      :empty-lines-before 1)
     ("p" "Personal Templates")
     ("pt" "ToDo Entry" entry
      (file+headline "C:\\emacs\\emacs_docs\\gtd_priv.org" "Capture")
      (file "C:\\emacs\\templates\\tpl-todo.txt")
      :empty-lines-before 1 :empty-lines-after 1)))
 '(package-selected-packages
   '(evil-tutor evil-collection airline-themes counsel-org-clock counsel-org-capture-string google google-maps gruber-darker-theme smex evil-org evil anaconda-mode pdf-tools))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;;inhibit start up screen
(setq inhibit-startup-screen t)

;;remove tool/menu bar
(menu-bar-mode 0)
(tool-bar-mode 0)

;;disable notifications
(setq ring-bell-function 'ignore)


;;capture
;;define capture key
(global-set-key (kbd "<f6>") 'org-capture)


;;;;;;evil-mode
(require 'evil)
(evil-mode 1)
;(setq evil-default-state 'emacs) ;; changes default state to emacs

;;(require 'evil-leader)
;;(global-evil-leader-mode)
;;(evil-leader/set-leader ",")
;;(evil-leader/set-key
;; "b" 'switch-to-buffer
;; "w" 'save-buffer)


;;org-mode
;;todos
(require 'org)
(setq org-todo-keywords
      '((sequence "NEXT" "TODO(t!)" "WAITING" "SOMEDAY" "PROJ" "DELEGATED" "DONE(d!)" "CANCELLED")))
(setq org-log-into-drawer t) 
(setq org-log-done 'time)


;;startup windowing
(split-window-horizontally)

	      
;;IDO
(ido-mode 1)

;;smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;pdf tools
(pdf-tools-install)


;; Ace window
;(unless (package-installed-p 'ace-window)
;  (package-refresh-contents)
;  (package-install 'ace-window)
;;set keybinding
;(global-set-key (kbd "C-x o") 'ace-window)  



;; Super-save to Auto Save
;install
;(unless (package-installed-p 'super-save)
;  (package-refresh-contents)
;  (package-install 'super-save))

;; add integration with ace-window
;(add-to-list 'super-save-triggers 'ace-window)

;;save on find-file
;(add-to-list 'super-save-hook-triggers 'find-file-hook)
;;turn off super-save for remote files
;(setq super-save-remote-files nil)
