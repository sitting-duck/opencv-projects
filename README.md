This repo has the OpenCV Repo in it as a Submodule. I'm going to use this repo as a way to store all the various builds of opencv I make over time. 

I'm going to be building these for Mac, Windows, and Linux as a I need them.I'm going to follow the same pattern every time and basically make a file build_version.sh for Mac and Linux, and build_version.bat for Windows. 

At this time, I am building 4.6.0, so the build script will step into the opencv submodule, checkout the 4.6.0 tag, and then start building. 

### On Cloning this Repo
If you're not familiar with Git Submodules you can brush up on them [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules). 

Cloning Instructions <br>
```bash

# note the extra flag before the repo url
git clone --recurse-submodules https://github.com/sitting-duck/opencv-projects.git

# If you forget to pass --recurse-submodules you can do these two commands
# inside your project after the fact
# your submodules will be empty folders until you do this
git submodule init
git submodule update

```

### Videos 
```
# me exploring building opencv on MacOS with Cuda support
https://www.youtube.com/watch?v=3q81_YBGq10
```


