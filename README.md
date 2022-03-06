# wowAddonTemplate  ![image](https://img.shields.io/github/repo-size/N6REJ/wowAddonTemplate)  [![Build Curse Release](https://github.com/N6REJ/wowAddonTemplate/actions/workflows/action.yml/badge.svg)](https://github.com/N6REJ/wowAddonTemplate/actions/workflows/action.yml)  ![image](https://img.shields.io/badge/Supports-Shadowlands-0B68D7)
Raw template for making wow addons including packager support.

Based on my [AdiBags Shadowlands Blacksmithing](https://github.com/N6REJ/AdiBags_Shadowlands_Blacksmithing) addon as an example addon.

### File structure
1) The *.gitignore* file is very important.  It helps facilitate things used only during development from being included in builds.
2) The *README.md* should be changed to describe your project.
3) *LICENSE* should be modified to any kind of license you wish.  Currently, it's *MIT* and will auto-populate with copyright and Author name @ build time.
4) *packager* folder is for local testing before creating an automatic release 
5) *.release* folder is the resulting folder from running the packager showing what it would look like to curse.
6) Every extension must have a *.toc* file that matches your extension name and must include each file needed for your extension
7) *.pkgmeta* is needed for the packager  ( Change filename in header to match _.toc_)
8) *core.lua* is the main program file, but you can name yours anything just change the name inside the *.toc*
9) *database.lua* is an import file that is used for tables and other "data" that your addon might need.
10) *wowaddontemplate.toc*   This is the actual name of your addon.  It's name MUST match the folder name for your addon including capitalization.
    
    
My suggestion would be to clone to the folder you want your repo to exist at then the set the following values in the *.toc*
* *## Interface: 90105* Replace the *90105* with the value needed for your version of the game.  This can be found by putting ```/run print((select(4, GetBuildInfo())))``` in the chat window
and then copying the value printed in chat.

* *## Title:* - Title to display/use in curse for your addon
* *## Version: @project-version@* - <b>DO NOT CHANGE THIS!</b>  It is used by the packager to automatically use your "tag" as the release name/number
* *## Author: Bearesquishy*  - Your name goes here.  If you put *@project-author@* instead of the name it will use your github user name instead
* *## X-License: MIT*  - Your license name/type
* *## X-Curse-Project-ID:*  - The ID # from your curseforge project page ![image](https://user-images.githubusercontent.com/1850089/140423589-df284750-aa28-4007-a098-a7dbad8c0581.png)

* *## DefaultState: enabled*  - Whether your addon should be enabled when added to the game the first time. ( set to *disabled* if you don't want it automatically "on" )
* *## Dependencies: AdiBags*  - Any dependencies you have
* *## X-Curse-Project-ID:* - This would be the value found in your project on [Curseforge](http://curseforge.com) that identifies your unique project.

### Required tools
* You must have [git](https://gitforwindows.org/) in order to use the packager locally.  It's also mandatory for using github repos.

* You need some kind of code/text editor or IDE.
  * [Visual Studio Code](https://code.visualstudio.com/) has extensions built for it specifically for wow addon development & lua
  * [Notepad++](https://notepad-plus-plus.org/) is a very good "text" editor
  * [phpstorm](https://www.jetbrains.com/phpstorm/) - *One of the top IDE's on the market.  Extremely powerful but knows nothing about wow*
  * [Visual Studio](https://visualstudio.microsoft.com/vs/preview/) - *Another powerful, and FREE IDE but like phpstorm it doesn't know wow*
  
  
### Recommended VS Code extensions
* https://marketplace.visualstudio.com/items?itemName=ketho.wow-api - *Adds IntelliSense features for World of Warcraft API to VS Code*
* https://marketplace.visualstudio.com/items?itemName=Septh.wow-bundle - *World of Warcraft addon developer toolset for VS Code*
* https://marketplace.visualstudio.com/items?itemName=elvador.wow-spell-tooltips - *"World of Warcraft"-style tooltips*
* https://marketplace.visualstudio.com/items?itemName=stanzilla.vscode-wow-toc - *World of Warcraft addon developer toolset for VS Code*
* https://marketplace.visualstudio.com/items?itemName=Koihik.vscode-lua-format - *VS Code plugin for LuaFormatter.*
* https://marketplace.visualstudio.com/items?itemName=trixnz.vscode-lua - *Provides Intellisense and Linting for Lua in VSCode*
* https://marketplace.visualstudio.com/items?itemName=formulahendry.terminal - *Simple terminal program*
* https://marketplace.visualstudio.com/items?itemName=McCarter.start-git-bash - *allows you to use git-bash from within VS code*
* https://marketplace.visualstudio.com/items?itemName=jerrygoyal.shortcut-menu-bar - *Cool little utility that adds a nice formatter to the menubar*
* https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens - *nice git handler*

### Useful links
* https://github.com/Ketho/vscode-wow-api/wiki/Recommended-settings - *I overlooked this!*
* https://www.wowhead.com/guide=1949/addon-writing-guide-a-basic-introduction-by-example - *A "<b>MUST READ</b>"*
* https://wowpedia.fandom.com/wiki/WelcomeHome:_Your_first_Ace3_Addon - *Very powerful & popular library*
* https://discord.me/addons - *Addon Developers Discord.  Nice guys*
* [Wowup](http://wowup.io) - *Nice, lightweight, yet powerful addon manager*
* [ViragDevTool](https://github.com/varren/ViragDevTool) - *useful tool to debug code in game ( use the github one not curseforge one*
* [bug grabber](https://www.curseforge.com/wow/addons/bug-grabber) - *simply grabs all Lua errors generated by WoW*
* [bug sack](https://www.curseforge.com/wow/addons/bugsack) - *Displays the errors that bugsack grabbed*
* [Lua Broswer](https://www.curseforge.com/wow/addons/lua-browser) - *It displays Lua errors that occurred during your play session, Similar to ViragDevTool*

### Tips
If you're new to developing wow addons like I am take the time to read what you can and start with very simple addons.
My most recent one is [AutoSwap](https://github.com/N6REJ/Auto_Swap) which simply types a message in chat whenever you change zones.

Watch for typo's and Capitalization.  Lua is very unforgiving about it.  You'd be amazed at the hours you can lose looking for the missing comma

Don't just copy someone else's code!  Not only is it rude it might just be a copyright violation, ergo breaking the law, that will land you on the wrong side of the dev world.
It's fine to use snippets, and look at how someone else did something, especially when learning, but there "might" be a better way.

Don't code in your main repo!  That is for finished work.  Create a *<b>branch</b>* and code there, then *<b>commit</b>* and *<b>push</b>*.  Once your totally done and you think its ready then create
a *<b>pr</b>* and merge it into your main code.  Then deleted your local branch you just finished with, *<b>checkout</b>* the main branch and *<b>pull</b>* to get your local 
copy up-to-date with what's in github

Don't be afraid to ask questions, but at the same time, be willing to take constructive criticism.

[Yuyuli](https://www.curseforge.com/members/yuyuli/projects) recently said to me "Your extensions are at what I would consider a beginner level...", which at first stung, I realized he was right and was trying to honestly guide me w/o holding my hand to my mouth.

Triple check your code.  I can't tell you have many release's I've done that I had dumb bugs.

Make a character on the [PTR server](https://us.battle.net/support/en/article/32229) and develop there!  That way your dev work doesn't break your retail character!! lol
took me months to figure this out!
Once there use *<b>wowup</b>* to add extensions you might need to that server, just like you do with retail.
Simply select <b>Retail PTR</b> ![image](https://user-images.githubusercontent.com/1850089/140425422-698057f6-2420-4bf6-af19-66587ee4846e.png)
 from the drop down on the top left of wowup interface and then click the magnifying glass to search for addons you need/want.

put *[comments](https://www.lua.org/pil/1.3.html)* <b>EVERYWHERE!!!!</b> Seriously, there is no such thing as "too many comments" aka rems.  Their purpose is to tell the person
reading the code what that part does.  You'll see them alot in my code and in a year when I need to update it and I can't remember what it did I'll be glad I did.
Don't say to yourself "Oh, I won't forget".  I'd almost bet money you will.  Especially in a large block of code.

Be very careful with "*<b>global</b>*" variable names.  anything simple/short is almost guaranteed to conflict with someone else's addon.

I hope you find this information useful.  Good luck on your endeavor to create wow addons.
if your ever a member of [The Øld Gods](https://www.guilded.gg/The-Old-Gods) feel free to look me up.  Or even better hop on discord and say Howdy

### Badges
the _.badges_ file contains sample badges for your git repo & curse page.  Be sure to adjust to your needs. 

[Bear's Curseforge](https://www.curseforge.com/members/bearleeable/projects)

***How to publish a release***
To publish assign tag and push to repo, release will be automatically generated per the action.yml and sent to curseforge.
To test the release type .packager/release.sh the local copy will be placed in the ".release" folder
