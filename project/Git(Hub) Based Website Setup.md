# Git(Hub) Based Website Setup

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



