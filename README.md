telnetach
=========

Telnet-based reader for 4chan and other imageboards. Powered with OMCK. Very alpha. So shitty code. Wow.

Supported boards
----------------

  * [4chan](http://4chan.org/)
  * [iichan](http://iichan.hk/)
  * [nowere.net](http://nowere.net/)

In theory, should work fine with any Wakaba-based board.

Requirements
------------

  * Ruby 1.9.x or 2.x
  * Ruby gems ``daemons`` and ``nokogiri`` installed

Configuration and running
-------------------------

Put to ``telnetach.yml`` configuration file target board address and telnet listening port. Then run ``ruby telnetach.rb start`` to start daemon. Use ``restart`` and ``stop`` parameters for appropriate actions.

Usage example
-------------

```
% telnet 172.22.0.109 1338
Trying 172.22.0.109...
Connected to 172.22.0.109.
Escape character is '^]'.
======================================================================
Welcome to http://boards.4chan.org/ 
To get the information about available commands send '?' or 'h' 
======================================================================

$ ?
Telnet client for http://boards.4chan.org/ imageboard.
`?` or `h`                     -- this help
`b`                            -- list of availble boards
`b /d/` or `b d`               -- last active threads from the board /d/
`t a 1234` or `t /a/1234`      -- read required tread completely
`t a 1234 3` or `t /a/1234 3`  -- read last 3 messages in thread
`i a 1234` or `i /a/1234`      -- get list of images in thread
`q`                            -- disconnect

$ b
Available boards:
/a/, /b/, /c/, /d/, /e/, /f/, /g/, /gif/, /h/, /hr/, /k/, /m/, /o/, /p/, /r/, /s/, /t/, /u/, /v/, /vg/, /vr/, /w/, /wg/, /i/, /ic/, /r9k/, /s4s/, /cm/, /hm/, /lgbt/, /y/, /3/, /adv/, /an/, /asp/, /biz/, /cgl/, /ck/, /co/, /diy/, /fa/, /fit/, /gd/, /hc/, /int/, /jp/, /lit/, /mlp/, /mu/, /n/, /out/, /po/, /pol/, /sci/, /soc/, /sp/, /tg/, /toy/, /trv/, /tv/, /vp/, /wsg/, /x/, /a/, /b/, /c/, /d/, /e/, /f/, /g/, /gif/, /h/, /hr/, /k/, /m/, /o/, /p/, /r/, /s/, /t/, /u/, /v/, /vg/, /vr/, /w/, /wg/, /i/, /ic/, /r9k/, /s4s/, /cm/, /hm/, /lgbt/, /y/, /3/, /adv/, /an/, /asp/, /biz/, /cgl/, /ck/, /co/, /diy/, /fa/, /fit/, /gd/, /hc/, /int/, /jp/, /lit/, /mlp/, /mu/, /n/, /out/, /po/, /pol/, /sci/, /soc/, /sp/, /tg/, /toy/, /trv/, /tv/, /vp/, /wsg/, /x/

```

License
-------

[WTFPL](http://www.wtfpl.net/)