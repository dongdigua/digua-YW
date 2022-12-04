(require 'org)
(require 'ox)

;; https://emacs.stackexchange.com/questions/36366/disable-auto-id-generation-in-org-mode-html-export
(defun html-body-id-filter (output backend info)
  "Remove random ID attributes generated by Org."
  (when (eq backend 'html)
    (replace-regexp-in-string
     " href=\"#org[[:alnum:]]\\{7\\}\""
     ""
     (replace-regexp-in-string
      " id=\"[[:alpha:]-]*org[[:alnum:]]\\{7\\}\""
      ""
      output t)
    t)))
(add-to-list 'org-export-filter-final-output-functions 'html-body-id-filter)

(setq org-html-validation-link nil
      org-export-with-toc 1
      org-export-with-section-numbers nil
      org-export-with-sub-superscripts nil)
(setq org-html-postamble-format '(("en"
                               "
<p class=\"author\">Author: dongdigua(dongdigua.github.io)</p>
<p class=\"date\">Build: %T</p>
<p>© 2022-2024 dongdigua All Rights Reserved.</p>
")))
(setq org-publish-project-alist
      '(("org-pages"
         :base-directory "."
         :base-extension "org"
         :publishing-directory "./../"
         :recursive t
         :publishing-function org-html-publish-to-html
         :preserve-breaks t
         :org-html-validation-link nil

         :html-link-home "https://dongdigua.github.io"
         :html-link-up "https://dongdigua.github.io/digua-YW"
         :html-postamble t
         )))

(defun myweb-publish ()
     "Publish myweb."
     (interactive)
     (setq debug-on-error t)
     (org-publish-all)
     )

