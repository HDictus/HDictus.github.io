(require 'ox-publish)

(setq org-html-postamble
"  <div id=\"comments\">
    <h2>Comments</h2>
    <div id=\"comment-list\"></div>
    <div><textarea id=\"author\" placeholder=\"Name\"></textarea></div>

    <div><textarea id=\"comment-input\" placeholder=\"Leave a comment...\"></textarea></div>
    <button onclick=\"submitComment()\">Submit</button>
  </div>

  <script src=\"../scripts/comments.js\"></script>
"
)


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
