# Instructions

1. Install Docker
2. Create a folder for this project. Let's call it `nasawds`
3. Clone or download this repo into `nasawds`
4. Clone [bruffridge/web-design-standards](https://github.com/bruffridge/web-design-standards) to your machine
5. Clone [bruffridge/web-design-standards-docs](https://github.com/bruffridge/web-design-standards-docs) to your machine
6. Open a bash terminal and `cd` to `nasawds`

    ### (Optional) If you want to update [GitHub pages](https://github.com/bruffridge/web-design-standards-docs/tree/gh-pages) follow these steps, otherwise skip to step 7.
    6. Copy the ssh private key you use for your GitHub account into `nasawds` Ex. `cp ~/.ssh/id_rsa .`
    7. Follow the instructions in the `config gh-pages:` comments in `Dockerfile` and save the file.

9. Build the docker image from the Dockerfile: `docker build -t nasawds .`
10. Install and build the standards and docs: `docker run -it -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds init`
11. Start the server: `docker run -it --name nasawds -p 127.0.0.1:4000:4000 -v /path/to/web-design-standards-docs:/apps/web-design-standards-docs -v /path/to/web-design-standards:/apps/web-design-standards nasawds`
12. `Ctrl+C` to stop the server
13. Next time you want to start the server: `` docker start -ai `docker ps -q -l` ``
14. Open another terminal window/tab
15. Run `watch` on standards: `` docker exec -it `docker ps -q -l` bash -c 'cd /apps/web-design-standards; echo "*-*-*-* Watching Standards *-*-*-*"; npm run watch' ``
16. Open another terminal window/tab
17. Run `watch` on docs: `` docker exec -it `docker ps -q -l` bash -c 'cd /apps/web-design-standards-docs; echo "*-*-*-* Watching Docs *-*-*-*"; npm run watch' ``
18. That's It! Make changes to the standards or docs source files and the jekyll site running on http://127.0.0.1:4000/web-design-standards-docs/ will be updated automatically. Just refresh your browser to see the changes.

## Update web-design-standards-docs gh-pages
Open another terminal window/tab
`` docker exec -it `docker ps -q -l` bash -c 'eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_rsa; cd /apps/web-design-standards-docs; gulp deploy; ssh-agent -k' ``

## Merge upstream changes using SourceTree
1. Add a remote for 18F/web-design-standards  
Name: `upstream`  
URL: `git@github.com:18F/web-design-standards.git`
2. In the left side bar under REMOTES right-click on staging and select "Pull upstream/staging into staging"
3. In the left side bar click "File status". Resolve any merge conflicts, commit, and push to origin/staging.

## Other helpful docker commands

### Stop latest container
`` docker stop `docker ps -q -l` ``

### Remove all stopped containers
`` docker rm $(docker ps -a -q) ``

## To batch change the color of .svg files

`cd /path/to/web-design-standards/src/img`  
`for f in *.svg; do sed -e 's/fill="#205493"/fill="#1d4893"/' -i "" "$f" ; done`
