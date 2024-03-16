(require 'ox-publish)


(setq org-publish-project-alist
      '(

("my-blog"
 :base-directory "/home/hugs/Dropbox/writing/blog/org-files"
 :base-extension "org"
 :publishing-directory "/home/hugs/Dropbox/writing/blog/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :postamble org-export-html-postamble
 )
("blog" :components ("my-blog"))
))
(org-roam-update-org-id-locations)
(org-publish-project "blog")
