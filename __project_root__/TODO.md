# TODO

* `twig.yaml`: attivazione alias twig `@includes` e `@email_includes`
* `twig.yaml`: aggiunta form thes `_shared/bs4_form_layout.html.twig`
* `services.yaml`: aggiunta estensioni (copiare estensioni da `src/Twig/Extension`
* Attivazione Google Analytics
* Attivazione Google Search Console
* Favicons
* pagine errore
* sitemap
* Ottimizzazione cache



**config/packages/twig.yaml**

```yaml
twig:
    default_path: '%kernel.project_dir%/templates'
    debug: '%kernel.debug%'
    strict_variables: '%kernel.debug%'
    exception_controller: null
    # globals:
    #   risorse: '%risorse%'
    form_themes:
      - '_shared/bs4_form_layout.html.twig'
    paths:
      '%kernel.project_dir%/templates/_shared': includes
      '%kernel.project_dir%/public/assets/email': email_includes
```


**config/services.yaml**

```yaml
# [...]
App\Twig\Extension\JsonDecode:
        tags:
            - { name: twig.extension }

    App\Twig\Extension\HtmlEntityDecode:
        tags:
            - { name: twig.extension }

    App\Twig\Extension\Shuffle:
        tags:
            - { name: twig.extension }

    App\Twig\Extension\Truncate:
        tags:
            - { name: twig.extension }
```


**public/.htaccess**

```apache
<IfModule mod_headers.c>
  <filesMatch "\.(png|svg|jpg|webp|ico|gif|xml|woff|woff2|ttf)$">
    Header set Cache-Control "max-age=31536000, public"
  </filesMatch>
  <filesMatch "\.(css)$">
    Header set Cache-Control "max-age=15768000, public"
  </filesMatch>
  <filesMatch "\.(js)$">
    Header set Cache-Control "max-age=15768000, private"
  </filesMatch>
  <filesMatch "\.(php)$">
    Header set Cache-Control "max-age=0, must-revalidate, private"
  </filesMatch>
</IfModule>

<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresDefault A300
  ExpiresByType image/png A31536000
  ExpiresByType image/gif A31536000
  ExpiresByType image/jpeg A31536000
  ExpiresByType image/pjpeg A31536000
  ExpiresByType image/webp A31536000
  ExpiresByType image/x-icon A31536000
  ExpiresByType text/javascript "modification 6 months"
  ExpiresByType text/css "modification 6 months"
  ExpiresByType text/html A300
</IfModule>
```
