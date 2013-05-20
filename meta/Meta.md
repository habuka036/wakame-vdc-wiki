This is the Meta Wiki Documentation.  

I hope you find it useful - Shaun  

Firstly, we will be using Markdown formatting, so all of your page names must end in ".md".  

Please take a peak at the Documentation below:   
  
[[Github Flavored Markdown|https://help.github.com/articles/github-flavored-markdown]]  
[[Markdown Syntax|http://daringfireball.net/projects/markdown/syntax]]   
[[Gollum Documentation|https://github.com/gollum/gollum/wiki]]   

  
Secondly, you REALLY need to understand that GitHub Wiki pages reside in a "flat namespace".  
  
For those of you who don't understand the implecations of having a "flat namespace", it just means that every wiki page MUST have a unique name.  
  
Thirdly, you can have sub-directories and use them to organize the wiki.   
Please note the directory listings below:  
<pre>
$ ls -p
css/  en/  _Footer.md  Home.md  images/  jp/  meta/  _Sidebar.md
$ ls -p en
admin-guide/  api-ref/  quick-start/  test_page.md
$ ls -p en/admin-guide/
Administrator-Guide.md
$ ls -p
PI-参考文献.md  クイックスタート.md  _Sidebar.md  日本語ホームページ.md  管理者ガイド.md
</pre>
  
Typically, the "_Footer" and "_Sidebar" will inherit from the parent directory.  
By using sub-directories, you can have different sidebar's and footer's.  
You only need to create a file "_Sidebar.md" or "_Footer.md" in the subdirectory.
(Although for the sake of consistency, you might want to leave the "_Footer" alone)  


Links, Links, Links ....  
Below is an example of a link:  
[[Meta First Steps|Meta_First_Steps]]  

The code looks like this:  
<pre>![[Meta First Steps|Meta_First_Steps]]</pre>

On the left side of the pipe, ("|" is the pipe), is what is displayed on the page.  
On the right side of the pipe is the name of the page or external link.  
