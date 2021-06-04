---
section: "meta"
category: "web"
title: "Git(Hub) & Gatsby Based Website Setup"
author: "Stello"
data: " 2020-10-16"
tags: ["web", "meta"]
---

# Git(Hub) & Gatsby Based Website Setup

## Structure

All content for the website will live in [natecostello/van_two_point_oh](https://github.com/natecostello/van_two_point_oh) refered to going forward as the 'content_repo'

The code for the website generation will live in [INSERT REPO] referred to going forward as the 'web_repo'

the content_repo will be a submodule that appears as a sub-directory name 'content' in the web_repo

## Workflow

### CONOPs

Blog posts and design information will be pushed to the content_repo via a normal the normal method:

```git push origin master```

After push, a Github Action tied to the content_repo issues a Repository Dispatch from the content-repo to the web_repo.  A Github Action tied to the web_repo updates its submodule and pushes the changes back to itself.  This push will then cause Netlify to rebuild the site.

Note, to update the local web_repo you need to add an option to the command to pull from origin:

```git pull --recurse-submodule origin master```

### Implementation

To add the required Action to content_repo:

* Add the following file: **content_repo**/.github/workflows/send_repository_dispatch.yml

  ```YAML
  name: RepositoryDispatchNameOne
  # Run this workflow every time a new commit is pushed to this repo
  on: push
  
  jobs:
    # Set the job key. The key is displayed as the job name
    # when a job name is not provided
    my_dispatch:
      name: RepositoryDispatchNameTwo
      # set the type of machine to run on
      runs-on: ubuntu-latest
      steps:
        - name: RepositoryDispatchNameThree
          uses: peter-evans/repository-dispatch@v1.1.2
          with:
           token: ${{ secrets.REPO_ACCESS_TOKEN }}
           repository: natecostello/web_repo
           event-type: my-test
           client-payload: '{"ref": "${{ github.ref }}", "sha": "${{ github.sha }}"}'
  ```

  ​	

* Generate a token with full repo access.  

* Add this token as a secret in the content_repo named REPO_ACCESS_TOKEN.

To add the required Action to to the web_repo:

* Add the following file: **web_repo**/.github/workflows/update_submodule.yml

  ```YAML
  name: SubModuleUpdator
  
  # Run this workflow a new commit pushed to /natecostello/content_repo
  on:
    repository_dispatch:
     types: [my-test]
  
  jobs:
    myEvent:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2.3.1
          with:
            token: ${{ secrets.PAT_MY_TOKEN }}
            submodules: recursive
        - name: update_and_commit 
          run: |
            git config --global user.name 'Nate Costello'
            git config --global user.email 'natecostello@@users.noreply.github.com'
            git submodule update --remote
            git add .
            git commit -m 'automatic update of content'
            git remote set-url origin https://x-access-token:${{ secrets.REPO_ACCESS_TOKEN }}@github.com/$GITHUB_REPOSITORY
            git push origin master
  ```

* Add the previously generated token as a secret in the web_repo named REPO_ACCESS_TOKEN



## Resources

[This Github Action and its README were super helpful](https://github.com/marketplace/actions/repository-dispatch)

[This blog post on the merits and hows of submodules for content was helpful](https://www.taniarascia.com/git-submodules-private-content/)



## Structure

TODO: Revisit the [mozilla page on structure](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/Document_and_website_structure) for later planning.

Landing Page

​	Menu: [Blog About Van ...]

​		-Blog ["section"]

​			--Post ["category"]

​				---Title

​				 ---Date

​				 ---Author

​				 ---Tags

​			 -About (fixed page) ["section"]

​			 -Van ["section"]

​				 --Electrical ["catagory"]

​					---Title

​					---Date (Should be "last updated")

​					---Tags

​				--Mechanical ["category"]

Top Page - About us - instagram feed - widgets - shell companies, Section='', Level=0

Blog Page - Programmatically generated with any thing that has 'Blog' in section field, Section='Blog', Level=1 

Blog Entry - Page (MPX), Section='Blog'

Van Page - Fixed Page (MDX) with overview and programatic links to Catagory Pages, Section='Van', Level=1

Catagory X Page - Fixed Page (MDX) with Summary and written/organized links to Level 3 Pages, programatic links to all articles, programatic links to blog entries tagged electrical, Section='Van', Level=2, Catagory='Electrical', Title='Electrial Overview'

Catagories=[Electrical, Mechanical, Vehicle, Functions/Appliances, Envelope]

Sub-catagory Page - Fixed Page (MDX) that covers topic, Section='Van', Level=3, Catagory='Electrical', Title='Battery', Tags=[Electrical, Battery, Box, Design]

Sub-catagory Page - Fixed Page (MDX) that covers topic, Section='Van', Level=3, Catagory='Electrical', Title='Inverter', Tags=[Electrical, Inverter, Design]

Sub-catagory Page - Fixed Page (MDX) that covers topic, Section='Van', Level=3, Catagory='Electrical', Title='Solar', Tags=[Electrical, Solar, Charging, Design]

Sub-catagory Page - -, Section='Van', Level=3, Category='Electrical', Title='Voltage Selection', Tags=[Electrical, Voltage, Design, Load Analysis]

Sub-category Page - -, Section='Van', Level 3, Category='Electrical', Title='Main Contactor', Tags=[electrical, control, protection]

#### Alternative thoughts on organization and frontmatter:

Replace levels with fixed types.  Allow multiple categories.  Include metatags to capture things like 'publish' or 'draft'.

```yaml

type: landingpage ||sectionpage || categorypage || article || blogpost
section: section1
categories: 
	# one or more categories is permitted
	- cat1
	- cat2
title: title #to be used in page construction
navTitle: navTitle #to be used in navigation construction
author: author
date: date
tags:
	- tag1
	- tag2
	- tag3
metatags:
	- metatag1
	- metatag2
cover: 
	# image file
	img: img
	# if attribution is needed
	source: [vecteezy]
	url: url

```

categories: ['electrical', 'galley'] - The idea is that an article can have more than one category to allow flexibility in future organization.

A categorypage can have one or more categories, in which case it covers the union of all articles that contain one of those categories.

The set of all categories is fixed and prescriptive.

### Menu Bar:

Top: [[Home] Van Blog]

Blog: [Home [Blog]]

Van: [Home [Van] CatagoryX CatagoryY CatagoryZ ]

Catagory X[ Home Van [Catagory X] SubCatagoryA SubCatagoryB ]



## Notes on using gatsby with github pages

[Gatsby's notes on the subject](https://www.gatsbyjs.com/docs/how-to/previews-deploys-hosting/how-gatsby-works-with-github-pages/)

[Another guide](https://jarednielsen.com/deploy-gatsbyjs-github-pages-user/)

Basically:

1. Initialize your site with ```gatsby new``` (which initializes a new git repository and performs initial commit)

2. Setup your github repo

3. Set your new gatsby site's git repository origin to the new github repo ```git remote add origin```

4. Move existing master branch to a new "develop" branch ```git branch -m develop```

5. From now on we push to ```develop``` modifications to the "infrastructure" ```git push origin develop```

6. To set this as default to eliminate need for parameters: ```git push -u origin develop```

7. Install the gatsby gh-pages plugin ```npm install gh-pages --save-dev```

8. Add the following to ``package.json``:

   ```json
   "scripts": {
   ...
   "deploy": "gatsby build --prefix-paths && gh-pages -d public -b master",
   }
   ```
   
   Note: The "-d public" is telling the plugin to commit/push the content in the public folder (created by gatsby build).  The "-b master" is telling the plugin to push that content to the "master" branch (otherwise it defaults to a  "gh-pages" branch (which it will create).  For the gritty details, see the gh-pages [documentation](https://github.com/tschaub/gh-pages).
   
9. Configure the github repo to enable github pages and select the "master" branch as the source.

10. Add the path prefix (which should be the name of your repo) to gatsby-config.js:

    ```javascript
    module.exports = {
    ...
      pathPrefix: "/reponame",
    }
    ```
    
11. Run ```npm run deploy``

12. Thats it.

## Notes on Cloning Repos into a Container (VSCode)

If you .devcontainer folder (which contains a DockerFile and devcontainer.json) in your repo, you can simply clone the repo into a container built by the above config files all inside VS Code [as described here](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-a-git-repository-or-github-pr-in-an-isolated-container-volume).

To make your .devcontainer stuff see [here](https://code.visualstudio.com/docs/remote/create-dev-container#_automate-dev-container-creation)

For this to work, however, the .devcontainer must be in the **default** branch of the github repo.  This is master or main by default, but if you shift to a develop branch like described above, you can have problems.

Also, it seems like the dockerfile is ignored and you need to use devcontainer.json to install gatsby and re-run npm install to allow the site to run after cloning into the container:

``    "postCreateCommand": "yes | npm install -g gatsby-cli && npm install",``

the yes | was an attempt to get it to bypass the prompt for key entry after first install..but it did not work.

## Notes on using gatsby-source-git

Because this plugin performs a shallow clone (hardcoded) no git information on a file basis is preserved.  If it instead performed a blobless clone, that data would be there to allow use of git information to inform a "last updated" field automatically in posts using something like this: [https://pragmaticpineapple.com/add-updated-at-to-your-gatsby-blog/](https://pragmaticpineapple.com/add-updated-at-to-your-gatsby-blog/).



## Notes on internal links to other MD(X) Files

Because I plan to generate page slug programatically, internal links withiin MD or MDX to other MD or MDX files will fail.  I have yet to find a out of the box solution to deal with this problem.  I'm considering the following options:

### Eliminate all internal links

This is easy, but limits traversability of information in the content repository.  The primary function of the content repository is to support design, so this approach impinges on that function.  That said, there are not too many cases of internal links as is.  I did plan to manually link from the category pages.

### Produce Manual Slugs

This limits flexibility on site organization or re-organization down the road.  It would also result in broken links when traversing the markdown in the github repository.

### Write A Custom MDX/REMARK Plugin

This approach is more work up front, but gives the best of all worlds:

Parse MD/MDX and extract links.  If the link is to a local MD/MDX, using the path, find the corresponding node, from the node, obtain the slug, replace the path with the slug.

Resources:

[https://stackoverflow.com/questions/48553146/how-to-change-markdown-link-relative-path-as-preprocessing-of-gatsby-transformer](https://stackoverflow.com/questions/48553146/how-to-change-markdown-link-relative-path-as-preprocessing-of-gatsby-transformer)

[https://www.gatsbyjs.com/tutorial/remark-plugin-tutorial/](https://www.gatsbyjs.com/tutorial/remark-plugin-tutorial/)

