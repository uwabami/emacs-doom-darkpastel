;;; doom-darkpastel-themes.el --- Custom theme using doom-themes -*- lexical-binding: nil; -*-
;;
;; Copyright (C) 2019 Youhei SASAKI
;;
;; Author: Youhei SASAKI <uwabami@gfd-dennou.org>
;; Maintainer: Youhei SASAKI <uwabami@gfd-dennou.org>
;; Created: Aug. 07, 2019
;; Modified: Aug. 7, 2019
;; Version: 0.0.1
;; Keywords: darkbackground pastel color
;; Homepage: https://github.com/uwabami/emacs-doom-darkpastel
;; Package-Requires: (doom-themes "20190804.2145")
;;
;; This file is not part of GNU Emacs.
;;
(require 'doom-themes)
(defgroup doom-darkpastel-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-darkpastel-set-background nil
  "If non-nil, set background color"
  :group 'doom-darkpastel-theme
  :type 'boolean)

(setq frame-background-mode (frame-parameter nil 'background-mode))
(def-doom-theme doom-darkpastel
  "Doom darkpastel theme"
  ;; name        default   256       16
  ((bg         '("#020202" "#020202" "black"        ))
   (bg-alt     '("#1C1C1C" "#191919" "black"        ))
   (base0      '("#1B1B1B" "#1B1B1B" "black"        ))
   (base1      '("#313131" "#303030" "brightblack"  ))
   (base2      '("#4A4A4A" "#4E4E4E" "brightblack"  ))
   (base3      '("#626262" "#626262" "brightblack"  ))
   (base4      '("#7B7B7B" "#808080" "brightblack"  ))
   (base5      '("#949494" "#949494" "brightblack"  ))
   (base6      '("#ACACAC" "#AFAFAF" "brightblack"  ))
   (base7      '("#C5C5C5" "#C6C6C6" "brightblack"  ))
   (base8      '("#DDDDDD" "#DADADA" "white"        ))
   (fg-alt     '("#F8F8F8" "#FFFFFF" "brightwhite"  ))
   (fg         '("#F6F6F6" "#EEEEEE" "white"        ))

   (grey       base4)
   (red        '("#FF4C4C" "#FF5F5F" "red"          ))
   (orange     '("#FFBF7F" "#FFAF5F" "brightred"    ))
   (green      '("#4CFF4C" "#5FFF5F" "green"        ))
   (teal       '("#7FFF7F" "#87FF87" "brightgreen"  ))
   (yellow     '("#FFFF7F" "#FFFF87" "brightyellow" ))
   (blue       '("#7F7FFF" "#8787FF" "brightblue"   ))
   (dark-blue  '("#4C4CFF" "#5F5FFF" "blue"         ))
   (magenta    '("#FF7FFF" "#FF87FF" "magenta"      ))
   (violet     '("#FF4CFF" "#FF5FFF" "brightmagenta"))
   (cyan       '("#7FFFFF" "#87FFFF" "brightcyan"   ))
   (dark-cyan  '("#4CFFFF" "#5FFFFF" "cyan"         ))

   ;; custom color
   (sky         '("#7FBFFF" "#8787FF" "brightblue"   ))
   (hi-red      '("#FF7F7F" "#FF7F7F" "brightred"    ))
   (purple      '("#BF7FFF" "#BF87FF" "brightblue"   ))
   (glass       '("#BFFF7F" "#87FF87" "brightgreen"  ))
   (dark-yellow '("#FFFF4C" "#FFFF4C" "yellow"       ))
   (hi-yellow   '("#FFFFBF" "#FFFF87" "brightyellow" ))
   (hi-magenta  '("#FFBFFF" "#FF87FF" "brightmagenta"))
   (blackblue   '("#222244" "#222244" "brightblack"  ))
   ;; face categories -- required for all themes
   (highlight      cyan)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        sky)
   (comments       base6)
   (doc-comments   (doom-lighten base6  0.25))
   (constants      orange)
   (functions      purple)
   (keywords       hi-red)
   (strings        teal)
   (variables      (doom-lighten blue 0.4))
   (type           yellow)
   (methods        cyan)
   (operators      blue)
   (numbers        orange)
   (region         blackblue)
   (error          magenta)
   (warning        yellow)
   (success        blue)
   (vc-modified    orange)
   (vc-added       teal)
   (vc-deleted     hi-red)

   ;; custom categories
   (hidden     `(,(car bg) "base0" "base0"))
   (modeline-fg     fg)
   (modeline-fg-alt base5)
   (modeline-bg   blackblue)
   (modeline-bg-l blackblue)
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  (
   ;; override default settings
   ((default &override)
    :background
    (if doom-darkpastel-set-background bg 'unspecified))
   ;; (font-lock-comment-face :foreground comments :background 'unspecified)
   ;; (font-lock-doc-face     :foreground comments :background 'unspecified)
   ((italic &override)
    :slant 'normal)
   (highlight
    :background base3
    :foreground fg
    :distant-foreground base8)
   ((hl-line &override)
    :background "#556b2f")
   ;;
   (font-lock-negation-char-face        :foreground cyan :bold t)
   (font-lock-preprocessor-face         :foreground red :bold t)
   (font-lock-preprocessor-char-face    :foreground red :bold t)
   (font-lock-regexp-grouping-backslash :foreground green :bold t)
   (font-lock-regexp-grouping-construct :foreground blue :bold t)

   ;; tab-bar-mode
   (tab-bar
    :inherit 'modeline-inactive)
   (tab-bar-tab
    :inherit 'mode-line)
   (tab-bar-tab-inactive
    :background modeline-bg-inactive
    :foreground modeline-fg-alt)

   ;; elscreen
   (elscreen-tab-control-face
    :inherit 'modeline-inactive)
   (elscreen-tab-current-screen-face
    :inherit 'mode-line)
   (elscreen-tab-background-face
    :inherit 'elscreen-tab-control-face
    :foreground base5
    :underlinet t)
   (elscreen-tab-other-screen-face
    :background modeline-bg-inactive
    :foreground modeline-fg-alt)

   (evil-goggles-default-face
    :inherit 'region
    :background (doom-blend region bg 0.5))
   ((line-number &override)
    :foreground base4)
   ((line-number-current-line &override)
    :foreground fg)
   ;;

   ;; modeline - disable box padding
   (mode-line
    :background modeline-bg
    :foreground modeline-fg)
   (mode-line-inactive
    :background modeline-bg-inactive
    :foreground modeline-fg-alt)
   (mode-line-emphasis :foreground base8)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l)
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l)

   ;; Doom modeline
   (doom-modeline-bar :background modeline-bg)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :bold t)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :bold t)
   (doom-modeline-buffer-project-root :foreground green :bold t)

   ;; --- major-mode faces -------------------
   ;; company
   (company-tooltip
    :inherit 'tooltip)
   (company-tooltip-common
    :foreground highlight :distant-foreground base0 :weight 'bold)
   (company-tooltip-search
    :background highlight :foreground bg :distant-foreground fg :weight 'bold)
   (company-tooltip-search-selection
    :background (doom-darken selection 0.25))
   (company-tooltip-selection
    :background selection :weight 'bold)
   (company-tooltip-mouse
    :background magenta   :foreground bg :distant-foreground fg)
   (company-tooltip-annotation
    :foreground violet :distant-foreground bg)
   (company-scrollbar-bg
    :inherit 'tooltip)
   (company-scrollbar-fg
    :background highlight)
   (company-preview
    :foreground comments)
   (company-preview-common
    :background base3 :foreground highlight)
   (company-preview-search
    :inherit 'company-tooltip-search)
   (company-template-field
    :inherit 'match)

   ;; company-box
   (company-box-candidate :foreground fg)

   ;; dired
   ;; (dired-header)
   ;; (dired-mark
   ;; (dired-marked
   (dired-directory  :weight 'bold :foreground blue)
   (dired-flagged    :inherit 'error)
   (dired-ignored    :inherit 'hidden)
   (dired-perm-write :weight 'bold :foreground yellow)
   (dired-symlink    :weight 'bold :foreground cyan)
   (dired-warning    :inherit font-lock-warning-face)

   (minibuffer-prompt  :foreground purple)
   ;; ido
   (ido-first-match  :underline t :weight 'bold)
   (ido-indicator    :foreground red :background bg)
   (ido-only-match   :foreground yellow :overline nil :underline t)
   (ido-subdir       :inherit 'dired-directory)
   (ido-virtual      :foreground comments)
   (ido-grid-match   :inherit 'ido-first-match)
   ;; (ido-grid-match-1  :foreground orange)
   ;; (ido-grid-match-2  :foreground blue)
   ;; (ido-grid-match-2  :foreground green)
   ;; ido-flex-with-migemo-migemo-face
   ;; ido-incomplete-regexp

   ;; ivy-mode
   (ivy-current-match            :inherit 'highlight)
   (ivy-confirm                  :inherit 'minibuffer-prompt)
   (ivy-subdir                   :inherit 'dired-directory)
   (ivy-minibuffer-match-face-1  :foreground sky)
   (ivy-minibuffer-match-face-2  :foreground green)
   (ivy-minibuffer-match-face-3  :foreground dark-cyan)
   (ivy-minibuffer-match-face-4  :foreground purple)

   ;;
   (rainbow-delimiters-mismatched-face :foreground hi-magenta :bold t)
   (rainbow-delimiters-depth-1-face    :foreground teal)
   (rainbow-delimiters-depth-2-face    :foreground blue)
   (rainbow-delimiters-depth-3-face    :foreground yellow)
   (rainbow-delimiters-depth-4-face    :foreground cyan)
   (rainbow-delimiters-depth-5-face    :foreground orange)
   (rainbow-delimiters-depth-6-face    :foreground glass)
   (rainbow-delimiters-depth-7-face    :foreground sky)
   (rainbow-delimiters-depth-8-face    :foreground hi-yellow)
   (rainbow-delimiters-depth-9-face    :foreground hi-red)

   ;; outline
   (outline-1 :inherit 'font-lock-function-name-face :bold t )
   (outline-2 :inherit 'font-lock-string-face :bold t )
   (outline-3 :inherit 'font-lock-keyword-face :bold t )
   (outline-4 :inherit 'font-lock-type-face :bold t )
   (outline-5 :inherit 'font-lock-constant-face :bold t )
   (outline-6 :inherit 'font-lock-variable-name-face :bold t )
   (outline-7 :inherit 'font-lock-builtin-face :bold t )
   (outline-8 :inherit 'font-lock-comment-face :bold t )

   ;; org-mode
   (org-level-1 :inherit 'outline-1)
   (org-level-2 :inherit 'outline-2)
   (org-level-3 :inherit 'outline-3)
   (org-level-4 :inherit 'outline-4)
   (org-level-5 :inherit 'outline-5)
   (org-level-6 :inherit 'outline-6)
   (org-level-7 :inherit 'outline-7)
   (org-level-8 :inherit 'outline-8)
   ;; (org-archived                    :foreground doc-comments)
   (org-block                       :background base1)
   (org-block-background            :background base1)
   (org-block-begin-line            :foreground comments)
   (org-block-end-line              :inherit 'org-block-begin-line)
   ;; (org-checkbox                    :inherit 'org-todo)
   ;; (org-checkbox-statistics-done    :inherit 'org-done)
   ;; (org-checkbox-statistics-todo    :inherit 'org-todo)
   ;; (org-code                        :foreground orange)
   ;; (org-date                        :foreground yellow)
   ;; (org-default                     nil)
   ;; (org-document-info               :foreground builtin)
   ;; (org-document-title              :foreground builtin :weight 'bold)
   ;; (org-done                        :inherit 'org-headline-done :bold 'inherit)
   ;; (org-ellipsis                    :underline nil :background nil :foreground grey)
   ;; (org-footnote                    :foreground orange)
   ;; (org-formula                     :foreground cyan)
   ;; (org-headline-done               :foreground base5)
   (org-hide                        :foreground base2)


   ;; (org-list-dt         :foreground highlight)
   ;; (org-meta-line       :foreground doc-comments)
   ;; (org-priority        :foreground red)
   ;; (org-property-value  :foreground doc-comments)
   ;; (org-quote           :background base3 :slant 'italic)
   ;; (org-special-keyword :foreground doc-comments)
   ;; (org-table           :foreground violet)
   ;; (org-tag             :foreground doc-comments :weight 'normal)
   ;; (org-ref-cite-face   :foreground yellow :weight 'light :underline t)
   ;; (org-latex-and-related :foreground magenta)
   (org-todo            :foreground magenta :bold t)
   (org-verbatim        :foreground dark-blue)
   (org-warning         :foreground warning)

   ;; ;; org-agenda
   ;; (org-agenda-done :inherit 'org-done)
   ;; (org-agenda-dimmed-todo-face :foreground comments)
   (org-agenda-calendar-event :inherit 'default)
   (org-agenda-date          :inherit 'default :bold t)
   (org-agenda-date-today    :underline t :bold t)
   (org-agenda-date-weekend  :foreground hi-red :bold t)
   (org-agenda-structure     :foreground fg :weight 'bold)
   (org-agenda-clocking      :background (doom-blend blue bg 0.2))
   (org-upcoming-deadline         :foreground (doom-blend fg bg 0.8))
   (org-upcoming-distant-deadline :foreground (doom-blend fg bg 0.5))
   (org-scheduled            :foreground fg)
   (org-scheduled-today      :foreground base7)
   (org-scheduled-previously :foreground base8)
   (org-time-grid            :foreground comments)
   (org-sexp-date            :foreground fg)

   (org-journal-calendar-entry-face     :underline t)
   (org-journal-calendar-scheduled-face :bold t)
   (org-journal-highlight               :inherit 'highlight)

   ;; ;; org-habit
   ;; (org-habit-clear-face          :weight 'bold :background base4)
   ;; (org-habit-clear-future-face   :weight 'bold :background base3)
   ;; (org-habit-ready-face          :weight 'bold :background (doom-blend blue bg-alt 0.5))
   ;; (org-habit-ready-future-face   :weight 'bold :background (doom-blend blue bg-alt 0.3))
   ;; (org-habit-alert-face          :weight 'bold :background (doom-blend yellow bg-alt 0.5))
   ;; (org-habit-alert-future-face   :weight 'bold :background (doom-blend yellow bg-alt 0.3))
   ;; (org-habit-overdue-face        :weight 'bold :background (doom-blend red bg-alt 0.5))
   ;; (org-habit-overdue-future-face :weight 'bold :background (doom-blend red bg-alt 0.3))

   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground blue)
   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground hi-red)
   (markdown-code-face :background (doom-lighten base3 0.05))
   ;; ;; org-mode
   ;; (org-hide :foreground hidden)
   ;; (solaire-org-hide-face :foreground hidden)

   ;; Wanderlust
   (wl-highlight-action-argument-face                :foreground "#f6f3e8")
   (wl-highlight-demo-face                           :foreground "#f6f3e8")
   (wl-highlight-folder-closed-face                  :foreground "#4cff4c")
   (wl-highlight-folder-few-face                     :foreground "#ff4c4c")
   (wl-highlight-folder-killed-face                  :foreground "#4f4f4f")
   (wl-highlight-folder-many-face                    :foreground "#ff4cff")
   (wl-highlight-folder-opened-face                  :foreground "#4cffff")
   (wl-highlight-folder-path-face                    :underline t :weight 'bold)
   (wl-highlight-folder-unknown-face                 :foreground "#4cffff")
   (wl-highlight-folder-unread-face                  :foreground "#4c4cff")
   (wl-highlight-folder-zero-face                    :foreground "#f6f3e8")
   (wl-highlight-header-separator-face               :foreground "#f6f3e8")
   (wl-highlight-logo-face                           :foreground "#f6f3e8")
   (wl-highlight-message-citation-header             :foreground "#7fff7f")
   (wl-highlight-message-cited-text-1                :foreground "#7fff7f")
   (wl-highlight-message-cited-text-2                :foreground "#FFE57F")
   (wl-highlight-message-cited-text-3                :foreground "#7f7fff")
   (wl-highlight-message-cited-text-4                :foreground "#A7FDEB")
   (wl-highlight-message-cited-text-5                :foreground "#ff7fff")
   (wl-highlight-message-cited-text-6                :foreground "#ff7f7f")
   (wl-highlight-message-cited-text-7                :foreground "#5CF19E")
   (wl-highlight-message-cited-text-8                :foreground "#FFD740")
   (wl-highlight-message-cited-text-9                :foreground "#4c4cff")
   (wl-highlight-message-cited-text-10               :foreground "#4cffff")
   (wl-highlight-message-header-contents             :foreground "#5CF19E")
   (wl-highlight-message-headers                     :foreground "#64FCDA" :weight 'bold)
   (wl-highlight-message-important-header-contents   :foreground "#ff4cff" :weight 'bold)
   (wl-highlight-message-important-header-contents2  :foreground "#ff4cff" :weight 'bold)
   (wl-highlight-message-signature                   :foreground "#afafaf")
   (wl-highlight-message-unimportant-header-contents :foreground "#afafaf")
   (wl-highlight-summary-answered-face               :foreground "#4cff4c")
   (wl-highlight-summary-copied-face                 :foreground "#f6f3e8")
   (wl-highlight-summary-deleted-face                :foreground "#ff4c4c")
   (wl-highlight-summary-displaying-face             :foreground "#f6f3e8")
   (wl-highlight-summary-disposed-face               :foreground "#ff7f7f")
   (wl-highlight-summary-flagged-face                :foreground "#FFE57F" :weight 'bold)
   (wl-highlight-summary-forwarded-face              :foreground "#f6f3e8")
   (wl-highlight-summary-high-read-face              :foreground "#f6f3e8")
   (wl-highlight-summary-high-unread-face            :foreground "#f6f3e8")
   (wl-highlight-summary-killed-face                 :foreground "#f6f3e8")
   (wl-highlight-summary-low-read-face               :foreground "#f6f3e8")
   (wl-highlight-summary-low-unread-face             :foreground "#f6f3e8")
   (wl-highlight-summary-new-face                    :foreground "#f6f3e8")
   (wl-highlight-summary-normal-face                 :foreground "#f6f3e8")
   (wl-highlight-summary-prefetch-face               :foreground "#f6f3e8")
   (wl-highlight-summary-refiled-face                :foreground "#7f7fff")
   (wl-highlight-summary-resend-face                 :foreground "#f6f3e8")
   (wl-highlight-summary-spam-face                   :foreground "#ff4cff" :weight 'bold)
   (wl-highlight-summary-target-face                 :foreground "#f6f3e8")
   (wl-highlight-summary-temp-face                   :foreground "#f6f3e8")
   (wl-highlight-summary-thread-top-face             :foreground "#f6f3e8")
   (wl-highlight-summary-unread-face                 :foreground "#f6f3e8")
   (wl-highlight-thread-indent-face                  :foreground "#f6f3e8")
   (wl-message-header-narrowing-face                 :foreground "#f6f3e8")
   (wl-summary-persistent-mark-face                  :foreground "#f6f3e8")
   ;;
   ;; revert original color
   (all-the-icons-red        :foreground "#AC4142")
   (all-the-icons-lred       :foreground "#EB595A")
   (all-the-icons-dred       :foreground "#843031")
   (all-the-icons-red-alt    :foreground "#ce5643")
   (all-the-icons-green      :foreground "#90A959")
   (all-the-icons-lgreen     :foreground "#C6E87A")
   (all-the-icons-dgreen     :foreground "#6D8143")
   (all-the-icons-yellow     :foreground "#FFD446")
   (all-the-icons-lyellow    :foreground "#FFC16D")
   (all-the-icons-dyellow    :foreground "#B48D56")
   (all-the-icons-blue       :foreground "#6A9FB5")
   (all-the-icons-blue-alt   :foreground "#2188b6")
   (all-the-icons-lblue      :foreground "#8FD7F4")
   (all-the-icons-dblue      :foreground "#446674")
   (all-the-icons-maroon     :foreground "#8F5536")
   (all-the-icons-lmaroon    :foreground "#CE7A4E")
   (all-the-icons-dmaroon    :foreground "#72584B")
   (all-the-icons-purple     :foreground "#AA759F")
   (all-the-icons-purple-alt :foreground "#5D54E1")
   (all-the-icons-lpurple    :foreground "#E69DD6")
   (all-the-icons-dpurple    :foreground "#694863")
   (all-the-icons-orange     :foreground "#D4843E")
   (all-the-icons-lorange    :foreground "#FFA500")
   (all-the-icons-dorange    :foreground "#915B2D")
   (all-the-icons-cyan       :foreground "#75B5AA")
   (all-the-icons-cyan-alt   :foreground "#61dafb")
   (all-the-icons-lcyan      :foreground "#A5FDEC")
   (all-the-icons-dcyan      :foreground "#48746D")
   (all-the-icons-pink       :foreground "#F2B4B8")
   (all-the-icons-lpink      :foreground "#FFBDC1")
   (all-the-icons-dpink      :foreground "#B18286")
   (all-the-icons-silver     :foreground "#716E68")
   (all-the-icons-lsilver    :foreground "#B9B6AA")
   (all-the-icons-dsilver    :foreground "#838484")
   )


  ;; --- extra variables ---------------------
  ()
  )

;;; doom-darkpastel-theme.el ends here
