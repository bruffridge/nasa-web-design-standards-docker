# Instructions

1. Install Docker
2. Clone this repo to your machine
3. Clone web-design-standards to your machine
4. Clone web-design-standards-docs to your machine
5. Open a bash terminal and `cd` to the location of this repo you cloned.
6. Build the docker image from the Dockerfile: `docker build -t nasawds .`
7. change start script in /path/to/web-design-standards-docs/package.json to `bundle exec jekyll serve --host 0.0.0.0`
8. Run the container: `docker run -it -p 127.0.0.1:4000:4000 -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds bash -c 'cd /apps/web-design-standards; echo "*-*-*-* Installing Standards *-*-*-*"; npm install; echo "*-*-*-* Building Standards *-*-*-*"; npm run build:package; echo "*-*-*-* Linking Standards *-*-*-*"; npm link; cd /apps/web-design-standards-docs; echo "*-*-*-* Installing Docs *-*-*-*"; npm install; echo "*-*-*-* Linking Standards to Docs *-*-*-*"; npm link uswds; echo "*-*-*-* Building Docs *-*-*-*"; npm run build; echo "*-*-*-* Starting Docs *-*-*-*"; npm start'`
9. Open another terminal window/tab
10. Find your running container id: `docker ps`
11. Run `watch` on standards: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards; echo "*-*-*-* Watching Standards *-*-*-*"; npm run watch'`
12. Open another terminal window/tab
13. Run `watch` on docs: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards-docs; echo "*-*-*-* Watching Docs *-*-*-*"; npm run watch'`
14. That's It! Make changes to the standards or docs source files and the jekyll site running on 127.0.0.1:4000 will be updated automatically. Just refresh your browser to see the changes.