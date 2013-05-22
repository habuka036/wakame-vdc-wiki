This is the Wiki Meta Documentation, I hope you find it useful.

## Markdown Documentation
Firstly, we will be using Markdown formatting, so all of your page names must end in ".md".  
Please take a peak at the Documentation below:   
  
[Github Flavored Markdown](https://help.github.com/articles/github-flavored-markdown)  
[Markdown Syntax](http://daringfireball.net/projects/markdown/syntax)   
[Gollum Documentation](https://github.com/gollum/gollum/wiki)   

## File naming convention  
Secondly, you REALLY need to understand that GitHub Wiki pages reside in a "flat namespace".  
For those of you who don't understand the implecations of having a "flat namespace", it just means that every wiki page MUST have a unique name.  
You can create pages in other languages, just make sure they end in ".md" ie: 
 
```bash
$ echo "# こんにちは" >  "こんにちは.md"
```
Please use ascii a-z,A-z,0-9 for directory naming. 

## Directory Structure    
Thirdly, you can have sub-directories and use them to organize the wiki.   
Please note the directory listings below:  

```bash
$ ls -p
css/  en/  _Footer.md  Home.md  images/  jp/  meta/  _Sidebar.md
$ ls -p en
admin-guide/  api-ref/  quick-start/ 
$ ls -p en/admin-guide/
Administrator-Guide.md
$ ls -p jp
PI-参考文献.md  クイックスタート.md  _Sidebar.md  日本語ホームページ.md  管理者ガイド.md
```
  
Typically, the "_Footer" and "_Sidebar" will inherit from the parent directory.  
By using sub-directories, you can have different sidebar's and footer's.  
(Note the "_Sidebar" under the "jp" directory)  
You only need to create a file "_Sidebar.md" or "_Footer.md" in the subdirectory.
(Although for the sake of consistency, you might want to leave the "_Footer" alone)  

## Creating Links
Links, Links, Links ....  

Below is an example of a link:  
[Meta First Steps](Meta First Steps)  

The code looks like this:  

```
[Meta First Steps](Meta First Steps)
```

The left side of the code, is what is displayed on the page.  
The right side of the code is the name of the page or external link.
  
  
Below is another example of a link:
[[Meta First Steps|Meta First Steps]]  

The code looks like this:  

```
[[Meta First Steps|Meta First Steps]]
```
On the left side of the pipe, ("|" is the pipe), is what is displayed on the page.  
On the right side of the pipe is the name of the page or external link.

(The first example renders well in the ReText markdown Editor) 
## Fenced Code Blocks  
Just wrap your code blocks in a blank line then 3 backquotes on the prior line,  
and 3 backquotes and a blank following line. (Blank lines not always necessary)

## Installing ReText Markdown Editor on CentOS 6
[Installing ReText - CentOS 6](Install ReText)

## Markdown Cheat Sheet
[Markdown Cheat Sheet](Cheat Sheet)

## Test Formatting Page
[Test Formatting page](test page)



