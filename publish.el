(require 'ox-publish)

(setq org-html-preamble
    "<!-- MailerLite Universal -->
<script>
    (function(w,d,e,u,f,l,n){w[f]=w[f]||function(){(w[f].q=w[f].q||[])
    .push(arguments);},l=d.createElement(e),l.async=1,l.src=u,
    n=d.getElementsByTagName(e)[0],n.parentNode.insertBefore(l,n);})
    (window,document,'script','https://assets.mailerlite.com/js/universal.js','ml');
    ml('account', '919123');
</script>
<!-- End MailerLite Universal -->
"
    )
(setq org-html-head
   "<link rel=\"stylesheet\" href=\"stylesheet.css\""
)

(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat "https://www.youtube.com/embed/"
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))

(setq org-html-postamble
      "<div class=\"ml-embedded\" data-form=\"UcmPfz\"></div>
       <script src=\"https://utteranc.es/client.js\"
        repo=\"HDictus/HDictus.github.io\"
        issue-term=\"title\"
        theme=\"github-light\"
        crossorigin=\"anonymous\"
        async>
      </script>

      <a href=\"index.html\"> home </a> <br>

 | <a href=\"https://bsky.app/profile/themightyhug.bsky.social\"> Bluesky </a>  
 | <a href=\"https://mastodon.social/@TheMightyHUG\"> Mastodon </a> 
 | <a href=\"https://www.linkedin.com/in/hugo-dictus-473a10145/\"> Linkedin </a> |

<br> <br>
Analytics by
<a title=\"Privacy-friendly Web Analytics\" href=\"https://clicky.com/101481402\"><img alt=\"Clicky\" src=\"//static.getclicky.com/media/links/badge.gif\" border=\"0\" /></a>
<script async data-id=\"101481402\" src=\"//static.getclicky.com/js\"></script>

"
)


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
