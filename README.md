# Instructions

1. Install Docker
2. Create a folder for this project. Let's call it `nasawds`
3. Clone or download this repo into `nasawds`
4. Clone [bruffridge/web-design-standards](https://github.com/bruffridge/web-design-standards) to your machine
5. Clone [bruffridge/web-design-standards-docs](https://github.com/bruffridge/web-design-standards-docs) to your machine
6. Open a bash terminal and `cd` to `nasawds`

    ### (Optional) If you want to update [GitHub pages](https://github.com/bruffridge/web-design-standards-docs/tree/gh-pages) follow these steps, otherwise skip to step 7.
    6. Copy the ssh private key you use for your GitHub account into `nasawds` Ex. `cp ~/.ssh/id_rsa .`
    7. Follow the instructions in the `config gh-pages:` comments in `Dockerfile` and `init.sh` and save the files.

9. Build the docker image from the Dockerfile: `docker build -t nasawds .`
10. Run the container and install and build the standards and docs: `docker run -it -p 127.0.0.1:4000:4000 -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds init` The `init` argument is only needed once. The next time the container is run `init` will not be needed. If for some reason you get kicked off of the container you can reconnect by getting the id of the running container `docker ps` then `docker exec -it your_container_id bash`
11. Start the server: `cd /apps/web-design-standards-docs` then `npm start`
12. Open another terminal window/tab
13. Find your running container id: `docker ps`
14. Run `watch` on standards: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards; echo "*-*-*-* Watching Standards *-*-*-*"; npm run watch'`
15. Open another terminal window/tab
16. Run `watch` on docs: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards-docs; echo "*-*-*-* Watching Docs *-*-*-*"; npm run watch'`
17. That's It! Make changes to the standards or docs source files and the jekyll site running on http://127.0.0.1:4000/web-design-standards-docs/ will be updated automatically. Just refresh your browser to see the changes.
