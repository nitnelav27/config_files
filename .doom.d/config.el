(setq user-full-name "Valentin Vergara Hidd"
      user-mail-address "valentinvergara@gmail.com")

(delete-selection-mode 1)

(if (eq system-type 'darwin)
    (add-to-list 'initial-frame-alist '(fullscreen . maximized)))

(setq fancy-splash-image "~/.doom.d/smithers.png")

(setq doom-theme 'doom-peacock)
(map! :leader
      :desc "Load a new theme"
      "h t" #'counsel-load-theme)

(setq doom-font (font-spec :family "Hasklig" :size 23)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 23)
      doom-big-font (font-spec :family "Hasklig" :size 35))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic :weight bold))

(setq org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(after! org
  (setq org-ellipsis " ▼ "
        org-hide-emphasis-markers t
        org-file-apps '((".pdf" . "zathura %s"))))

(use-package! org-ref
  :after org
  :init
  (setq org-ref-default-bibliography '("~/Dropbox/galactica.bib")))
        ;org-ref-completion-library 'org-ref-ivy-cite))

(use-package! org-ref-bibtex
  :after org)

(use-package! doi-utils
  :after org)

(use-package! org-ref-arxiv
  :after org)

(use-package! org-ref-isbn
  :after org)

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

(setq org-roam-directory "~/docs/OrgRoam")
(use-package! company-org-roam
  :when (featurep! :completion company)
  :after org-roam
  :config
  (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

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
      eshell-visual-commands '("zsh" "ssh"))

;(map! :leader
;      (:prefix-map ("a" . "applications")
;       (:prefix ("t" . "terminal emulators")
;        :desc "open vterm" "t" #'vterm)
;       )
;      )
(map! :leader
      :desc "open a vterm"
      "t t" #'vterm)
