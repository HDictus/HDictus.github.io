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

(setq org-html-postamble
      "<div class=\"ml-embedded\" data-form=\"UcmPfz\"></div>
       <script src=\"https://utteranc.es/client.js\"
        repo=\"HDictus/HDictus.github.io\"
        issue-term=\"title\"
        theme=\"github-light\"
        crossorigin=\"anonymous\"
        async>
      </script>

      <a href=\"index.html\"> home </a>
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
