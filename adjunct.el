;;; adjunct.el --- extension for managing custom processes -*- lexical-binding: t -*-

;;; Copyright (C) 2020, John Nelson

;; This file is NOT part of emacs

;; Version 1.0
;; Author: John Nelson
;; Keywords: process manager tools
;; License: GNU General Public License >= 3
;; Package-Requires: ((transient "0.1.0") (emacs "25.3"))

;;; Commentary:

;; Emacs extension for managing custom processes that you keep
;; switching over to a terminal to run ad nauseam

;;; Code:

(require 'transient)

(setq adjunct-command-map '())

(defun adjunct--simple-message ()
  "Just a simple message for use in testing."
  (interactive)
  (message "hello!"))

(define-transient-command adjunct-transient ()
  "Adjunct transient command."
  ["Actions"
   ("a" "Action a" adjunct--simple-message)
   ("b" "Action b" adjunct--simple-message)
   ("c" "Action c" adjunct--simple-message)])

(define-minor-mode adjunct-mode
  "Adjunct global minor mode."
  :init-value nil
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "C-x p") 'adjunct-transient)
	    map))

;;;###autoload
(defun adjunct ()
  "Invoke the adjunct buffer."
  (interactive)
  (message "hello, world!"))

(provide 'adjunct)
;;; adjunct.el ends here
