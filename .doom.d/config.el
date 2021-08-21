(setq user-full-name "Valentin Vergara Hidd"
      user-mail-address "valentinvergara@gmail.com")

(setq evil-want-fine-undo t
      auto-save-default t)

;(display-time 1)

(delete-selection-mode 1)

(if (eq system-type 'darwin)
    (add-to-list 'initial-frame-alist '(fullscreen . maximized)))

(setq fancy-splash-image "~/.doom.d/smithers.png")

(setq doom-theme 'doom-Iosvkem)
(map! :leader
      :desc "Load a new theme"
      "h t" #'counsel-load-theme)

(if (eq system-type 'darwin)
    (setq doom-font (font-spec :family "Hasklig" :size 20)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
      doom-big-font (font-spec :family "Hasklig" :size 30))
    (setq doom-font (font-spec :family "Hasklig" :size 23)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 23)
      doom-big-font (font-spec :family "Hasklig" :size 35))
    )

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic :weight bold))

(use-package! beacon
  :custom
  (beacon-push-mark 10)
  (beacon-color "#cc342b")
  (beacon-blink-delay 0.3)
  (beacon-blink-duration 0.3)
  :config
  (beacon-mode)
  (global-hl-line-mode 1))

(after! org
  (setq org-ellipsis " ▼ "
        org-hide-emphasis-markers t
        org-agenda-files '(("~/.doom.d/agenda/agenda.org")
                           ("~//doom.d/agenda/weekly.org"))
        org-log-done 'time
        org-file-apps '((".pdf" . "zathura %s"))
        org-todo-keywords
        '((sequence
           "TODO(t)"
           "READ(r)"
           "TEACH(e)"
           "MEETING(m)"
           "|"
           "DONE(d)"
           ))))

(use-package! org-ref
  :after org
  :init
  (setq org-ref-default-bibliography '("~/references/master.bib")
        org-ref-bibliography-notes '("~/references/notes.org")
        reftex-default-bibliography  '("~/references/master.bib")
        bibtex-completion-bibliography '("~/references/master.bib")
        reftex-bibpath-environment-variables '("~/references/master.bib")))
        ;org-ref-completion-library 'org-ref-ivy-cite))

(use-package! org-ref-bibtex
  :after org-ref)

(use-package! doi-utils
  :after org-ref)

(use-package! org-ref-arxiv
  :after org-ref)

(use-package! org-ref-isbn
  :after org-ref)

(setq org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(setq org-latex-default-packages-alist '(("utf8" "inputenc" t ("pdflatex"))
                                         ("" "graphicx" t)
                                         ("" "wrapfig" t)
                                         ("" "rotating" t)
                                         ("" "grffile" t)
                                         ("normalem" "ulem" t)
                                         ("" "amsmath" t)
                                         ("" "amssymb" t)
                                         ("" "capt-of" t)))

(setq org-latex-packages-alist '(("dvipsnames" "xcolor")
                                 ("colorlinks=true,breaklinks=true,citecolor=cyan,urlcolor=blue" "hyperref")
                                 ("" "natbib")
                                 ("" "float")
                                 ("" "ragged2e")
                                 ("" "tabularx")
                                 ("" "subcaption")
                                 ("" "mdframed")))

(setq org-latex-listings 'listings
      org-latex-listings-options
      '(("frame" "single")
        ("backgroundcolor" "\\color{define}")
        ("commentstyle" "\\color{codegreen}")
        ("keywordstyle" "\\color{magenta}")
        ("stringstyle" "\\color{codepurple}")
        ("basicstyle" "\\linespread{0.9}\\fontsize{9}{12}\\selectfont\\ttfamily")
        ("breakatwhitespace" "false")
        ("breaklines" "true")
        ("captionpos" "b")
        ("keepspaces" "true")
        ("numbers" "left")
        ("numberstyle" "\\tiny\\color{gray}")
        ("numbersep" "5pt")
        ("showspaces" "false")
        ("showstringspaces" "false")
        ("showtabs" "false")
        ("tabsize" "4")))

(setq org-pretty-entities t)

(use-package! org-roam
  :init
  (setq org-roam-directory "~/references/roam"
      org-roam-graph-executable "/usr/bin/dot")
      )

(setq orb-insert-interface 'helm-bibtex
        orb-insert-link-description 'citekey
        orb-autokey-format "%A%y"
        orb-templates
        '(("r" "ref" plain (function org-roam--capture-get-point) ""
           :file-name "${citekey}"
           :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}\n#+ALIAS:\n"
           :unnarrowed t)))


(use-package! org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :requires bibtex-completion)

;(use-package! elpy
;  :init (elpy-enable))
;(use-package! company
;  :init (setq company-idle-delay 0.2))
;(use-package! lsp-mode)
;(use-package! lsp-ui
;  :after lsp-mode)
;(use-package! lsp-pyright
;  :after lsp-mode)

(setq shell-file-name "/usr/bin/zsh"
      eshell-aliases-file "~/.doom.d/aliases"
      eshell-syntax-highlighting-global-mode t
      eshell-visual-commands '("zsh" "ssh")
      vterm-max-scrollback 5000)

(map! :leader
      :desc "open a vterm"
      "t t" #'vterm)
