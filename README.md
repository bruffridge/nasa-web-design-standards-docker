# Instructions

1. Install Docker
2. Build an image: docker build -t nasawds .
3. change start script in /path/to/web-design-standards-docs/package.json to `bundle exec jekyll serve --host 0.0.0.0`
3. Run the container: docker run -it -p 127.0.0.1:4000:4000 -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds bash -c 'cd /apps/web-design-standards; npm link; cd /apps/web-design-standards-docs; npm link uswds; npm install; npm run build; npm start'