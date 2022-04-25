# Daniaals Ghost Blog

This repo is the barebones Ghost repo that has the extra functionality of Azure Storage and Disqus comments on blog posts.
Please give my post a read which instructs you on how to deploy Ghost to Azure on a Linux instance.

## Useful Commands

- **Build Docker File** - `docker build -t myname/ghost-blog .`
- **Push docker image to repository such as Docker hub** - `docker push myname/ghost-blog`
- **To run and test your docker image locally** - `docker run -d --name ghost-blog-test -e url=http://localhost:3001 -p 3001:2368 myname/ghost-blog`

Note: Before you push you will have to login with docker so use `docker login` to authenticate.
<br><br>

# Use this locally to check the contents of the configuration file for example

docker exec -t -i my-ghost-without /bin/bash

To view the contents of a file, use `cat config.production.json` and this will be printed to the terminal.

# Default Configuration

```json
{
  "url": "http://localhost:2368",
  "server": {
    "port": 2368,
    "host": "::"
  },
  "database": {
    "client": "mysql",
    "connection": {
      "host": "",
      "port": 3306,
      "user": "",
      "password": "",
      "database": "",
      "ssl": {
        "rejectUnauthorized": true
      }
    }
  },
  "storage": {
    "active": "ghost-storage-azure",
    "ghost-storage-azure": {
      "connectionString": "",
      "container": "",
      "cacheControl": "2592000",
      "useDatedFolder": true,
      "cdnUrl": "",
      "useHttps": "true"
    }
  },
  "logging": {
    "transports": ["file", "stdout"]
  },
  "paths": {
    "contentPath": "/var/lib/ghost/content"
  },
  "mail": {
    "transport": "SMTP",
    "options": {
      "service": "",
      "host": "",
      "port": 587,
      "secure": true,
      "auth": {
        "user": "",
        "pass": ""
      }
    }
  }
}
```

# Live Docker Logs

To see the docker logs in the Azure web app, go to app service logs and turn it on to "File System"

# Disqus Comments

In the `post.hbs` file you will see

```html
<section class="article-comments gh-canvas">
  <div id="disqus_thread"></div>
  <script>
    var disqus_config = function () {
        this.page.url = "{{url absolute="true"}}";
        this.page.identifier = "ghost-{{comment_id}}"
    };
    (function() {
    var d = document, s = d.createElement('script');
    s.src = ''; // Add your Disqus URL here
    s.setAttribute('data-timestamp', + new Date());
    (d.head || d.body).appendChild(s);
    })();
  </script>
</section>
```

I have added a comment on the line where you need to enter your Disqus URL.
