# Instructions

1. Install Docker
2. Create a folder for this project. Let's call it `nasawds`
3. Download and extract the files in this repo into `nasawds`
4. Clone [bruffridge/web-design-standards](https://github.com/bruffridge/web-design-standards) into `nasawds/web-design-standards`
5. Clone [bruffridge/web-design-standards-docs](https://github.com/bruffridge/web-design-standards-docs) into `nasawds/web-design-standards-docs`

    ### (Optional) If you want to update [GitHub pages](https://github.com/bruffridge/web-design-standards-docs/tree/gh-pages) follow these steps, otherwise skip to step 6.
    6. Copy the ssh private key you use for your GitHub account into `nasawds`
    7. Follow the instructions in the `config gh-pages:` comments in `Dockerfile` and `init.sh` and save the files.

8. Open a bash terminal and `cd` to `nasawds`
9. Build the docker image from the Dockerfile: `docker build -t nasawds .`
10. Run the container: `docker run -it -p 127.0.0.1:4000:4000 -v /path/to/nasawds/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/nasawds/web-design-standards:/apps/web-design-standards nasawds`
11. Start the server: `cd /apps/web-design-standards-docs` then `npm start`
12. Open another terminal window/tab
13. Find your running container id: `docker ps`
14. Run `watch` on standards: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards; echo "*-*-*-* Watching Standards *-*-*-*"; npm run watch'`
15. Open another terminal window/tab
16. Run `watch` on docs: `docker exec -it your_container_id bash -c 'cd /apps/web-design-standards-docs; echo "*-*-*-* Watching Docs *-*-*-*"; npm run watch'`
17. That's It! Make changes to the standards or docs source files and the jekyll site running on http://127.0.0.1:4000/web-design-standards-docs/ will be updated automatically. Just refresh your browser to see the changes.
