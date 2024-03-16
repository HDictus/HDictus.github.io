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
 :postamble org-export-html-postamble
 )
("blog-attachments"
 :base-directory "/home/hugs/Dropbox/writing/blog/"
 :base-extension "js//|png//|json"
 :publishing-directory "/home/hugs/Dropbox/writing/blog_published/"
 :recursive t 
 :publishing-function org-publish-attachment
 )
("blog" :components ("my-blog" "blog-attachments"))
))
(org-roam-update-org-id-locations)
(org-publish-project "blog")
