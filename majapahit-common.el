;;; majapahit-theme.el --- majapahit for Emacs.

;; Copyright (C) 2015 Alexander Adhyatma

;; Author: Alexander Adhyatma
;; URL: http:/gitlab.com/franksn/majapahit-theme/
;; Version: 0.1.0
;;
;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A colorscheme for emacs with light and dark variant of it.
;;
;;; Installation:
;;
;;   M-x package-install -> majapahit-theme
;;
;;   (load-theme 'majapahit-dark t)
;;     or
;;   (load-theme 'majapahit-light t)
;;
;;; Bugs
;;
;; report any bugs to franksn@openmailbox.org
;;
;;; Code:

(defgroup majapahit-theme nil
  "majapahit-theme options."
  :group 'faces)

(defcustom majapahit-theme-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
  :group 'majapahit-theme)

(defcustom majapahit-theme-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'majapahit-theme)

(defun create-majapahit-theme (variant theme-name)
  (let ((class '((class color) (min-colors 89))) ;;                    
        ;;                                      DARK        LIGHT
        (base          (if (eq variant 'dark)  "#b9b9b3"  "#686f66" ))
        (cursor        (if (eq variant 'dark)  "#292922"  "#63635d" ))
        (bg1           (if (eq variant 'dark)  "#2c2c25"  "#fafaf6" ))
        (bg2           (if (eq variant 'dark)  "#33332c"  "#f3f3ed" ))
        (bg3           (if (eq variant 'dark)  "#40403a"  "#e3e3da" ))
        (bg4           (if (eq variant 'dark)  "#73736c"  "#c6c3bd" ))
        (key1          (if (eq variant 'dark)  "#c5617a"  "#c5617a" ))
        (key2          (if (eq variant 'dark)  "#cf7b86"  "#cf7b86" ))
        (builtin       (if (eq variant 'dark)  "#88a087"  "#9e8464" ))
        (keyword       (if (eq variant 'dark)  "#d25f76"  "#d25f76" ))
        (const         (if (eq variant 'dark)  "#c4beaa"  "#8b8b7f" ))
        (comment       (if (eq variant 'dark)  "#999999"  "#bababa" ))
        (comment-bg    (if (eq variant 'dark)  "#2c2c25"  "#fafaf6" ))
        (func          (if (eq variant 'dark)  "#d99174"  "#cf8164" ))
        (str           (if (eq variant 'dark)  "#babea5"  "#a1a58e" ))
        (type          (if (eq variant 'dark)  "#51808f"  "#4b97a8" ))
        (comp          (if (eq variant 'dark)  "#e47376"  "#db4764" ))
        (var           (if (eq variant 'dark)  "#b1b59c"  "#a5947b" ))
        (err           (if (eq variant 'dark)  "#8e6a60"  "#f1847b" ))
        (war           (if (eq variant 'dark)  "#d99481"  "#d69e8b" ))
        (inf           (if (eq variant 'dark)  "#51808f"  "#51808f" ))
        (suc           (if (eq variant 'dark)  "#b5c37b"  "#abbe71" ))
        (green         (if (eq variant 'dark)  "#88a087"  "#84a082" ))
        (yellow        (if (eq variant 'dark)  "#d99174"  "#cf8164" ))
        (cyan          (if (eq variant 'dark)  "#8b8b7f"  "#a1a194" ))
        (violet        (if (eq variant 'dark)  "#c5617a"  "#d25f76" ))
        (red           (if (eq variant 'dark)  "#c5617a"  "#d25f76" ))
        (active1       (if (eq variant 'dark)  "#262622"  "#f3f3ed" ))
        (active2       (if (eq variant 'dark)  "#63635a"  "#e7e7da" ))
        (inactive      (if (eq variant 'dark)  "#45b0d3"  "#7eacac" ))
        (m-line-brdr   (if (eq variant 'dark)  "#4c4c42"  "#e3e3da" ))
        (org-block-bg  (if (eq variant 'dark)  "#232528"  "#d9e6dd" ))
        (org-h1-bg     (if (eq variant 'dark)  "#32434a"  "#edf1ed" ))
        (org-h2-bg     (if (eq variant 'dark)  "#63635a"  "#edf2e9" ))
        (org-h3-bg     (if (eq variant 'dark)  "#73735a"  "#f1f3e1" ))
        (org-h4-bg     (if (eq variant 'dark)  "#8c8c7d"  "#f6f1e1" ))
        (highlight     (if (eq variant 'dark)  "#333c45"  "#fefef9" ))
        (green-bg      (if (eq variant 'dark)  "#29422d"  "#dae6d0" ))
        (red-bg        (if (eq variant 'dark)  "#512e31"  "#eed9d2" ))
        (pth1          (if (eq variant 'dark)  "#b1b59c"  "#b1b59c" ))
        (pth2          (if (eq variant 'dark)  "#f1bc6a"  "#d79c85" ))
        (pth3          (if (eq variant 'dark)  "#4da0c4"  "#418580" ))
        (pth4          (if (eq variant 'dark)  "#9aba4f"  "#78a975" ))
        (pth5          (if (eq variant 'dark)  "#c4556b"  "#c4556b" ))
        (pth6          (if (eq variant 'dark)  "#5c737c"  "#5c737c" ))
        (pth7          (if (eq variant 'dark)  "#ac907c"  "#927c5e" ))
        (pth8          (if (eq variant 'dark)  "#e47376"  "#db4764" ))
        )

    (custom-theme-set-faces
     theme-name

;;;;; basics
     `(cursor ((,class (:background ,cursor))))
     `(default ((,class (:background ,bg1 :foreground ,base))))
     `(default-italic ((,class (:italic t))))
     `(error ((,class (:foreground ,err))))
     `(eval-sexp-fu-flash ((,class (:background ,suc :foreground ,bg1))))
     `(eval-sexp-fu-flash-error ((,class (:background ,err :foreground ,bg1))))

;;;;; font-locks

     `(font-lock-builtin-face ((,class (:foreground ,builtin))))
     `(font-lock-comment-face ((,class (:foreground ,comment :background ,(when majapahit-theme-comment-bg comment-bg)))))
     `(font-lock-constant-face ((,class (:foreground ,const))))
     `(font-lock-doc-face ((,class (:foreground ,comment))))
     `(font-lock-doc-string-face ((,class (:foreground ,comment))))
     `(font-lock-function-name-face ((,class (:foreground ,func))))
     `(font-lock-keyword-face ((,class (:foreground ,keyword))))
     `(font-lock-negation-char-face ((,class (:foreground ,bg4))))
     `(font-lock-preprocessor-face ((,class (:foreground ,func))))
     `(font-lock-reference-face ((,class (:foreground ,cyan))))
     `(font-lock-string-face ((,class (:foreground ,str))))
     `(font-lock-type-face ((,class (:foreground ,type))))
     `(font-lock-variable-name-face ((,class (:foreground ,var))))
     `(font-lock-warning-face ((,class (:foreground ,war :background ,bg1))))

;;;;; extra font-locks
     `(clojure-keyword-face ((,class (:foreground ,green :underline t))))
     `(clojure-interop-method-face ((,class (:foreground ,bg4))))
     `(elixir-atom-face ((,class (:foreground ,comment))))
     `(c-annotation-face ((,class (:inherit ,font-lock-constant-face))))
     `(sh-heredoc ((,class (:inherit ,font-lock-doc-face))))
     `(css-selector ((,class (:inherit ,font-lock-keyword-face))))
     `(css-property ((,class (:inherit ,font-lock-string-face))))
     `(sh-quoted-exec ((,class (:inherit ,font-lock-function-name-face))))

;;;;; basic stuffs
     `(fringe ((,class (:background ,bg1 :foreground ,base))))
     `(highlight ((,class (:foreground ,base :background ,bg2))))
     `(hl-line ((,class (:background ,bg2))))
     `(isearch ((,class (:bold t :foreground ,inf :background ,bg1))))
     `(lazy-highlight ((,class (:foreground ,yellow :background ,bg1 :weight normal))))
     `(link ((,class (:foreground ,inf :underline t))))
     `(link-visited ((,class (:foreground ,keyword :underline t))))
     `(match ((,class (:background ,bg1 :foreground ,inf :weight bold))))
     `(minibuffer-prompt ((,class (:bold t :foreground ,inf))))
     `(page-break-lines ((,class (:foreground ,active2))))
     `(popup-tip-face ((,class (:background ,active2 :foreground ,base :bold nil :italic nil :underline nil))))
     `(region ((,class (:background ,highlight))))
     `(secondary-selection ((,class (:background ,bg3))))
     `(show-paren-match-face ((,class (:background ,suc))))
     `(success ((,class (:foreground ,suc))))
     `(tooltip ((,class (:background ,active2 :foreground ,base :bold nil :italic nil :underline nil))))
     `(vertical-border ((,class (:foreground ,bg4))))
     `(warning ((,class (:foreground ,war ))))

;;;;; anzu-mode
     `(anzu-mode-line ((,class (:foreground ,yellow :weight bold))))

;;;;; company
     `(company-echo-common ((,class (:background ,base :foreground ,bg1))))
     `(company-preview ((,class (:background ,bg1 :foreground ,key1))))
     `(company-preview-common ((,class (:background ,bg2 :foreground ,keyword))))
     `(company-preview-search ((,class (:background ,bg2 :foreground ,green))))
     `(company-scrollbar-bg ((,class (:background ,bg2))))
     `(company-scrollbar-fg ((,class (:background ,comp))))
     `(company-template-field ((,class (:inherit region))))
     `(company-tooltip ((,class (:background ,active2 :foreground ,(if (eq variant 'dark) active1 str)))))
     `(company-tooltip-annotation ((,class (:background ,active2 :foreground ,inf))))
     `(company-tooltip-common ((,class (:background ,active2 :foreground ,base))))
     `(company-tooltip-common-selection ((,class (:foreground ,(if (eq variant 'dark) suc war)))))
     `(company-tooltip-mouse ((,class (:inherit highlight))))
     `(company-tooltip-search ((,class (:inherit match))))
     `(company-tooltip-selection ((,class (:background ,(if (eq variant 'dark) "#51808f" "#4b97a8") :bold t))))

;;;;; diff
     `(diff-added             ((,class :background nil :foreground ,green)))
     `(diff-changed           ((,class :background nil :foreground ,inf)))
     `(diff-indicator-added   ((,class :background nil :foreground ,green)))
     `(diff-indicator-changed ((,class :background nil :foreground ,inf)))
     `(diff-indicator-removed ((,class :background nil :foreground ,red)))
     `(diff-refine-added      ((,class :background ,green :foreground ,bg4)))
     `(diff-refine-changed    ((,class :background ,inf :foreground ,bg4)))
     `(diff-refine-removed    ((,class :background ,red :foreground ,bg4)))
     `(diff-removed           ((,class :background nil :foreground ,red)))

;;;;; dired
     `(dired-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(dired-flagged ((,class (:foreground ,red))))
     `(dired-header ((,class (:foreground ,comp :weight bold))))
     `(dired-ignored ((,class (:inherit shadow))))
     `(dired-mark ((,class (:foreground ,comp :weight bold))))
     `(dired-marked ((,class (:foreground ,violet :weight bold))))
     `(dired-perm-write ((,class (:foreground ,base :underline t))))
     `(dired-symlink ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
     `(dired-warning ((,class (:foreground ,war))))

;;;;; ediff
     `(ediff-current-diff-A ((,class(:background ,org-h1-bg :foreground ,inf))))
     `(ediff-current-diff-Ancestor ((,class(:background ,org-h2-bg :foreground ,str))))
     `(ediff-current-diff-B ((,class(:background ,org-h4-bg :foreground ,yellow))))
     `(ediff-current-diff-C ((,class(:background ,org-h3-bg :foreground ,green))))
     `(ediff-even-diff-A ((,class(:background ,bg3))))
     `(ediff-even-diff-Ancestor ((,class(:background ,bg3))))
     `(ediff-even-diff-B ((,class(:background ,bg3))))
     `(ediff-even-diff-C ((,class(:background ,bg3))))
     `(ediff-fine-diff-A ((,class(:background nil :bold t :underline t))))
     `(ediff-fine-diff-Ancestor ((,class(:background nil :bold t :underline t))))
     `(ediff-fine-diff-B ((,class(:background nil :bold t :underline t))))
     `(ediff-fine-diff-C ((,class(:background nil :bold t :underline t))))
     `(ediff-odd-diff-A ((,class(:background ,bg4))))
     `(ediff-odd-diff-Ancestor ((,class(:background ,bg4))))
     `(ediff-odd-diff-B ((,class(:background ,bg4))))
     `(ediff-odd-diff-C ((,class(:background ,bg4))))

;;;;; ein
     `(ein:cell-input-area((,class (:background ,bg2))))
     `(ein:cell-input-prompt ((,class (:foreground ,(if (eq variant 'dark) suc green)))))
     `(ein:cell-output-prompt ((,class (:foreground ,err))))
     `(ein:notification-tab-normal ((,class (:foreground ,builtin))))
     `(ein:notification-tab-selected ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))

;;;;; eldoc
     `(eldoc-highlight-function-argument ((,class (:foreground ,(if (eq variant 'dark) suc red) :bold t))))

;;;;; erc
     `(erc-input-face ((,class (:foreground ,func))))
     `(erc-my-nick-face ((,class (:foreground ,key1))))
     `(erc-nick-default-face ((,class (:foreground ,inf))))
     `(erc-nick-prefix-face ((,class (:foreground ,yellow))))
     `(erc-notice-face ((,class (:foreground ,str))))
     `(erc-prompt-face ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))
     `(erc-timestamp-face ((,class (:foreground ,builtin))))

;;;;; eshell
     `(eshell-ls-archive ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory ((,class (:foreground ,inf :weight bold))))
     `(eshell-ls-executable ((,class (:foreground ,suc :weight bold))))
     `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special ((,class (:foreground ,yellow :weight bold))))
     `(eshell-ls-symlink ((,class (:foreground ,cyan :weight bold))))
     `(eshell-ls-unreadable ((,class (:foreground ,base))))
     `(eshell-prompt ((,class (:foreground ,keyword :weight bold))))

;;;;; flycheck
     `(flycheck-error
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,err)))
        (,class (:foreground ,base :background ,err :weight bold :underline t))))
     `(flycheck-error-list-checker-name ((,class (:foreground ,keyword))))
     `(flycheck-fringe-error ((,class (:foreground ,err :weight bold))))
     `(flycheck-fringe-info ((,class (:foreground ,inf :weight bold))))
     `(flycheck-fringe-warning ((,class (:foreground ,war :weight bold))))
     `(flycheck-info
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,inf)))
        (,class (:foreground ,base :background ,inf :weight bold :underline t))))
     `(flycheck-warning
       ((,(append '((supports :underline (:style line))) class)
         (:underline (:style line :color ,war)))
        (,class (:foreground ,base :background ,war :weight bold :underline t))))

;;;;; git-gutter-fr
     `(git-gutter-fr:added ((,class (:foreground ,green :weight bold))))
     `(git-gutter-fr:deleted ((,class (:foreground ,war :weight bold))))
     `(git-gutter-fr:modified ((,class (:foreground ,inf :weight bold))))

;;;;; git-timemachine
     `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,inf :bold t :background ,org-h1-bg))))

;;;;; gnus
     `(gnus-emphasis-highlight-words ((,class (:background ,(if (eq variant 'dark) err suc) :foreground ,(when (eq variant 'light) bg1)))))
     `(gnus-header-content ((,class (:foreground ,keyword))))
     `(gnus-header-from ((,class (:foreground ,var))))
     `(gnus-header-name ((,class (:foreground ,comp))))
     `(gnus-header-subject ((,class (:foreground ,func :bold t))))
     `(gnus-summary-cancelled ((,class (:background ,(if (eq variant 'dark) err suc) :foreground ,bg1))))

;;;;; guide-key
     `(guide-key/highlight-command-face ((,class (:foreground ,base))))
     `(guide-key/key-face ((,class (:foreground ,key1))))
     `(guide-key/prefix-command-face ((,class (:foreground ,key2 :weight bold))))

;;;;; helm
     `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
     `(helm-bookmark-file ((,class (:foreground ,base))))
     `(helm-bookmark-gnus ((,class (:foreground ,comp))))
     `(helm-bookmark-info ((,class (:foreground ,comp))))
     `(helm-bookmark-man ((,class (:foreground ,comp))))
     `(helm-bookmark-w3m ((,class (:foreground ,comp))))
     `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-not-saved ((,class (:foreground ,comp :background ,bg1))))
     `(helm-buffer-process ((,class (:foreground ,builtin :background ,bg1))))
     `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
     `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
     `(helm-candidate-number ((,class (:background ,bg1 :foreground ,inf :bold t))))
     `(helm-ff-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(helm-ff-dotted-directory ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
     `(helm-ff-executable ((,class (:foreground ,suc :background ,bg1 :weight normal))))
     `(helm-ff-file ((,class (:foreground ,base :background ,bg1 :weight normal))))
     `(helm-ff-invalid-symlink ((,class (:foreground ,red :background ,bg1 :weight bold))))
     `(helm-ff-prefix ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
     `(helm-ff-symlink ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
     `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-lineno ((,class (:foreground ,base :background ,bg1))))
     `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
     `(helm-grep-running ((,class (:foreground ,func :background ,bg1))))
     `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
     `(helm-header-line-left-margin ((,class (:foreground ,inf :background ,nil))))
     `(helm-match ((,class (:foreground ,inf :background ,bg1))))
     `(helm-match-item ((,class (:inherit match))))
     `(helm-moccur-buffer ((,class (:foreground ,func :background ,bg1))))
     `(helm-selection ((,class (:background ,bg2 :foreground ,keyword))))
     `(helm-selection-line ((,class (:background ,bg3))))
     `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
     `(helm-source-header ((,class (:background ,comp :foreground ,bg1 :bold t))))
     `(helm-time-zone-current ((,class (:foreground ,builtin :background ,bg1))))
     `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
     `(helm-visible-mark ((,class (:foreground ,bg1 :background ,green))))

;;;;; helm-swoop
     `(helm-swoop-target-line-block-face ((,class (:foreground ,base :background ,highlight))))
     `(helm-swoop-target-line-face ((,class (:foreground ,base :background ,highlight))))
     `(helm-swoop-target-word-face ((,class (:foreground ,bg1 :background ,suc))))

;;;;; ido
     `(ido-first-match ((,class (:foreground ,comp :bold t))))
     `(ido-only-match ((,class (:foreground ,(if (eq variant 'dark) suc red) :bold t))))
     `(ido-subdir ((,class (:foreground ,key1))))
     `(ido-vertical-match-face ((,class (:foreground ,comp :underline nil))))

;;;;; info
     `(info-header-xref ((,class (:foreground ,func :underline t))))
     `(info-menu ((,class (:foreground ,suc))))
     `(info-node ((,class (:foreground ,func :bold t))))
     `(info-quoted-name ((,class (:foreground ,builtin))))
     `(info-reference-item ((,class (:background nil :underline t :bold t))))
     `(info-string ((,class (:foreground ,str))))
     `(info-title-1 ((,class (:height 1.4 :bold t))))
     `(info-title-2 ((,class (:height 1.3 :bold t))))
     `(info-title-3 ((,class (:height 1.3))))
     `(info-title-4 ((,class (:height 1.2))))

;;;;; linum-mode
     `(linum ((,class (:foreground ,str :background ,bg2))))

;;;;; magit
     `(magit-blame-culprit ((,class :background ,org-h4-bg :foreground ,yellow)))
     `(magit-blame-header  ((,class :background ,org-h4-bg :foreground ,green)))
     `(magit-blame-sha1    ((,class :background ,org-h4-bg :foreground ,func)))
     `(magit-blame-subject ((,class :background ,org-h4-bg :foreground ,yellow)))
     `(magit-blame-time    ((,class :background ,org-h4-bg :foreground ,green)))
     `(magit-blame-name    ((,class :background ,org-h4-bg :foreground ,yellow)))
     `(magit-blame-heading ((,class :background ,org-h4-bg :foreground ,green)))
     `(magit-blame-hash    ((,class :background ,org-h4-bg :foreground ,func)))
     `(magit-blame-summary ((,class :background ,org-h4-bg :foreground ,yellow)))
     `(magit-blame-date    ((,class :background ,org-h4-bg :foreground ,green)))
     `(magit-branch ((,class (:foreground ,const :weight bold))))
     `(magit-branch-current ((,class (:background ,org-h1-bg :foreground ,inf :weight bold :box t))))
     `(magit-branch-local ((,class (:background ,org-h1-bg :foreground ,inf :weight bold))))
     `(magit-branch-remote ((,class (:background ,org-h2-bg :foreground ,str :weight bold))))
     `(magit-diff-context-highlight ((,class (:background ,bg3 :foreground ,base))))
     `(magit-diff-file-header ((,class (:background nil :foreground ,str))))
     `(magit-diff-hunk-header ((,class (:background nil :foreground ,builtin))))
     `(magit-hash ((,class (:foreground ,var))))
     `(magit-hunk-heading           ((,class (:background ,bg3))))
     `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
     `(magit-item-highlight ((,class :background ,bg2)))
     `(magit-log-author ((,class (:foreground ,func))))
     `(magit-log-head-label-head ((,class (:background ,yellow :foreground ,bg1 :bold t))))
     `(magit-log-head-label-local ((,class (:background ,inf :foreground ,bg1 :bold t))))
     `(magit-log-head-label-remote ((,class (:background ,suc :foreground ,bg1 :bold t))))
     `(magit-log-head-label-tags ((,class (:background ,violet :foreground ,bg1 :bold t))))
     `(magit-log-head-label-wip ((,class (:background ,cyan :foreground ,bg1 :bold t))))
     `(magit-log-sha1 ((,class (:foreground ,str))))
     `(magit-process-ng ((,class (:foreground ,war :weight bold))))
     `(magit-process-ok ((,class (:foreground ,func :weight bold))))
     `(magit-section-heading        ((,class (:foreground ,keyword :weight bold))))
     `(magit-section-highlight      ((,class (:background ,bg2))))
     `(magit-section-title ((,class (:background ,bg1 :foreground ,builtin :weight bold))))

;;;;; mode-line
     `(mode-line           ((,class (:foreground ,base :background ,active1 :box (:color ,m-line-brdr :line-width 1)))))
     `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1     :box (:color ,m-line-brdr :line-width 1)))))
     `(mode-line-buffer-id ((,class (:bold t :foreground ,func))))

;;;;; neotree
     `(neo-dir-link-face ((,class (:foreground ,inf :weight bold))))
     `(neo-expand-btn-face ((,class (:foreground ,base))))
     `(neo-file-link-face ((,class (:foreground ,base))))
     `(neo-root-dir-face ((,class (:foreground ,func :weight bold))))

;;;;; org
     `(org-agenda-clocking ((,class (:foreground ,comp))))
     `(org-agenda-date ((,class (:foreground ,var :height ,(if majapahit-theme-org-height 1.1 1.0)))))
     `(org-agenda-date-today ((,class (:weight bold :foreground ,keyword :height ,(if majapahit-theme-org-height 1.3 1.0)))))
     `(org-agenda-date-weekend ((,class (:weight normal :foreground ,var))))
     `(org-agenda-done ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t))))
     `(org-agenda-structure ((,class (:weight bold :foreground ,comp))))
     `(org-block ((,class (:foreground ,base))))
     `(org-block-background ((,class (:background ,org-block-bg))))
     `(org-clock-overlay ((,class (:foreground ,comp))))
     `(org-code ((,class (:foreground ,cyan))))
     `(org-column ((,class (:background ,highlight))))
     `(org-column-title ((,class (:background ,highlight))))
     `(org-date ((,class (:underline t :foreground ,var) )))
     `(org-date-selected ((,class (:background ,func :foreground ,bg1) )))
     `(org-document-info-keyword ((,class (:foreground ,str))))
     `(org-document-title ((,class (:foreground ,func :weight bold :height ,(if majapahit-theme-org-height 1.4 1.0) :underline t))))
     `(org-done ((,class (:foreground ,(if (eq variant 'dark) suc green) :bold t :overline t :background ,org-h3-bg))))
     `(org-ellipsis ((,class (:foreground ,builtin))))
     `(org-footnote  ((,class (:underline t :foreground ,base))))
     `(org-hide ((,class (:foreground ,base))))
     `(org-level-1 ((,class (:bold t :foreground ,inf :height ,(if majapahit-theme-org-height 1.3 1.0) :background ,org-h1-bg :overline t))))
     `(org-level-2 ((,class (:bold t :foreground ,str :height ,(if majapahit-theme-org-height 1.2 1.0) :background ,org-h2-bg))))
     `(org-level-3 ((,class (:bold nil :foreground ,green :height ,(if majapahit-theme-org-height 1.1 1.0) :background ,org-h3-bg))))
     `(org-level-4 ((,class (:bold nil :foreground ,yellow :background ,org-h4-bg))))
     `(org-level-5 ((,class (:bold nil :foreground ,inf))))
     `(org-level-6 ((,class (:bold nil :foreground ,str))))
     `(org-level-7 ((,class (:bold nil :foreground ,green))))
     `(org-level-8 ((,class (:bold nil :foreground ,yellow))))
     `(org-link ((,class (:underline t :foreground ,comment))))
     `(org-mode-line-clock-overrun ((,class (:foreground ,err))))
     `(org-priority ((,class (:foreground ,war :bold t))))
     `(org-quote ((,class (:inherit org-block :slant italic))))
     `(org-scheduled ((,class (:foreground ,comp))))
     `(org-scheduled-today ((,class (:foreground ,func :weight bold :height 1.2))))
     `(org-sexp-date ((,class (:foreground ,base))))
     `(org-special-keyword ((,class (:foreground ,func))))
     `(org-table ((,class (:foreground ,yellow :background ,org-h4-bg))))
     `(org-todo ((,class (:foreground ,war :bold t :overline t :background ,org-h4-bg))))
     `(org-verbatim ((,class (:foreground ,inf))))
     `(org-verse ((,class (:inherit org-block :slant italic))))
     `(org-warning ((,class (:foreground ,err))))

;;;;; perspective
     `(persp-selected-face ((,class (:bold t :foreground ,func))))

;;;;; powerline
     `(powerline-active1 ((,class (:background ,active2 :foreground ,base))))
     `(powerline-active2 ((,class (:background ,active2 :foreground ,base))))
     `(powerline-inactive1 ((,class (:background ,bg2 :foreground ,base))))
     `(powerline-inactive2 ((,class (:background ,bg2 :foreground ,base))))

;;;;; rainbow-delimiters
     `(rainbow-delimiters-depth-1-face ((,class :foreground ,pth1 :weight bold)))
     `(rainbow-delimiters-depth-2-face ((,class :foreground ,pth2 :weight bold)))
     `(rainbow-delimiters-depth-3-face ((,class :foreground ,pth3 :weight bold)))
     `(rainbow-delimiters-depth-4-face ((,class :foreground ,pth4 :weight bold)))
     `(rainbow-delimiters-depth-5-face ((,class :foreground ,pth5 :weight bold)))
     `(rainbow-delimiters-depth-6-face ((,class :foreground ,pth6 :bold t)))
     `(rainbow-delimiters-depth-7-face ((,class :foreground ,pth7 :bold t)))
     `(rainbow-delimiters-depth-8-face ((,class :foreground ,pth8 :bold t)))
     `(rainbow-delimiters-depth-9-face ((,class :foreground ,green :bold t)))
     `(rainbow-delimiters-depth-10-face ((,class :foreground ,yellow :bold t)))
     `(rainbow-delimiters-depth-11-face ((,class :foreground ,type :bold t)))
     `(rainbow-delimiters-depth-12-face ((,class :foreground ,pth8 :bold t)))
     `(rainbow-delimiters-unmatched-face ((,class :foreground ,war :bold t)))

;;;;; shm
     `(shm-current-face ((,class (:background ,green-bg))))
     `(shm-quarantine-face ((,class (:background ,red-bg))))

;;;;; smartparens
     `(sp-pair-overlay-face ((,class (:background ,highlight :foreground nil))))
     `(sp-show-pair-match-face ((,class (:foreground ,(if (eq variant 'dark) suc red) :weight bold :underline t))))

;;;;; term
     `(term ((,class (:foreground ,base :background ,bg1))))
     `(term-color-black ((,class (:foreground ,bg4))))
     `(term-color-blue ((,class (:foreground ,inf))))
     `(term-color-cyan ((,class (:foreground ,cyan))))
     `(term-color-green ((,class (:foreground ,green))))
     `(term-color-magenta ((,class (:foreground ,builtin))))
     `(term-color-red ((,class (:foreground ,red))))
     `(term-color-white ((,class (:foreground ,base))))
     `(term-color-yellow ((,class (:foreground ,yellow))))

;;;;; which-key
     `(which-key-command-description-face ((,class (:foreground ,base))))
     `(which-key-group-description-face ((,class (:foreground ,key2))))
     `(which-key-key-face ((,class (:foreground ,func :bold t))))
     `(which-key-separator-face ((,class (:background nil :foreground ,str))))
     `(which-key-special-key-face ((,class (:background ,func :foreground ,bg1))))

;;;;; other, need more work
     `(ac-completion-face ((,class (:underline t :foreground ,keyword))))
     `(ffap ((,class (:foreground ,base))))
     `(flx-highlight-face ((,class (:foreground ,comp :underline nil))))
     `(font-latex-bold-face ((,class (:foreground ,comp))))
     `(font-latex-italic-face ((,class (:foreground ,key2 :italic t))))
     `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
     `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
     `(font-latex-string-face ((,class (:foreground ,str))))
     `(icompletep-determined ((,class :foreground ,builtin)))
     `(js2-external-variable ((,class (:foreground ,comp  ))))
     `(js2-function-param ((,class (:foreground ,const))))
     `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,str))))
     `(js2-jsdoc-html-tag-name ((,class (:foreground ,key1))))
     `(js2-jsdoc-value ((,class (:foreground ,str))))
     `(js2-private-function-call ((,class (:foreground ,const))))
     `(js2-private-member ((,class (:foreground ,base))))
     `(js3-error-face ((,class (:underline ,war))))
     `(js3-external-variable-face ((,class (:foreground ,var))))
     `(js3-function-param-face ((,class (:foreground ,key2))))
     `(js3-instance-member-face ((,class (:foreground ,const))))
     `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
     `(js3-warning-face ((,class (:underline ,keyword))))
     `(mu4e-cited-1-face ((,class (:foreground ,base))))
     `(mu4e-cited-7-face ((,class (:foreground ,base))))
     `(mu4e-header-marks-face ((,class (:foreground ,comp))))
     `(mu4e-view-url-number-face ((,class (:foreground ,comp))))
     `(slime-repl-inputed-output-face ((,class (:foreground ,comp))))
     `(trailing-whitespace ((,class :foreground nil :background ,err)))
     `(undo-tree-visualizer-current-face ((,class :foreground ,builtin)))
     `(undo-tree-visualizer-default-face ((,class :foreground ,base)))
     `(undo-tree-visualizer-register-face ((,class :foreground ,comp)))
     `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var)))
     `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
     `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
     `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
     `(web-mode-function-name-face ((,class (:inherit ,font-lock-function-name-face))))
     `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
     `(web-mode-html-attr-value-face ((,class (:foreground ,keyword))))
     `(web-mode-html-tag-face ((,class (:foreground ,builtin))))
     `(web-mode-keyword-face ((,class (:foreground ,keyword))))
     `(web-mode-string-face ((,class (:foreground ,str))))
     `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
     `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face)))))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'majapahit-common)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; majapahit-common.el ends here
