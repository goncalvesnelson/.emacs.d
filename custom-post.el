;; Use cmd as the meta on OSX
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

;; Comment or uncomment line shortcut
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(define-key global-map (kbd "C-c ç") 'comment-or-uncomment-region-or-line)

;; Zenburn theme
(use-package doom-themes)
(setq centaur-theme 'doom-zenburn)
