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
10. Install and build the standards and docs: `docker run -it -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds init`
11. Start the server: `docker run -it --name nasawds -p 127.0.0.1:4000:4000 -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds`
12. `Ctrl+C` to stop the server
13. Next time you want to start the server: `` docker start -ai `docker ps -q -l` ``
14. That's It! Make changes to the standards or docs source files and the jekyll site running on http://127.0.0.1:4000/web-design-standards-docs/ will be updated automatically. Just refresh your browser to see the changes.
