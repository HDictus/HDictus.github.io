(require 'ox-publish)

(setq org-publish-project-alist
      '(

("my-blog"
 :base-directory "/home/hugs/Dropbox/writing/blog/"
 :base-extension "org"
 :publishing-directory "/home/hugs/Dropbox/writing/blog_published/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 )

))
(org-roam-update-org-id-locations)
(org-publish-project "my-blog")
