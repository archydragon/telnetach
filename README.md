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
/a/, /b/, /c/, /d/, /e/, /f/, /g/, /gif/, /h/, /hr/, /k/, /m/, /o/, /p/, /r/, /s/, /t/, /u
/, /v/, /vg/, /vr/, /w/, /wg/, /i/, /ic/, /r9k/, /s4s/, /cm/, /hm/, /lgbt/, /y/, /3/, /adv
/, /an/, /asp/, /biz/, /cgl/, /ck/, /co/, /diy/, /fa/, /fit/, /gd/, /hc/, /int/, /jp/, /li
t/, /mlp/, /mu/, /n/, /out/, /po/, /pol/, /sci/, /soc/, /sp/, /tg/, /toy/, /trv/, /tv/, /v
p/, /wsg/, /x/, /a/, /b/, /c/, /d/, /e/, /f/, /g/, /gif/, /h/, /hr/, /k/, /m/, /o/, /p/, /
r/, /s/, /t/, /u/, /v/, /vg/, /vr/, /w/, /wg/, /i/, /ic/, /r9k/, /s4s/, /cm/, /hm/, /lgbt/
, /y/, /3/, /adv/, /an/, /asp/, /biz/, /cgl/, /ck/, /co/, /diy/, /fa/, /fit/, /gd/, /hc/, 
/int/, /jp/, /lit/, /mlp/, /mu/, /n/, /out/, /po/, /pol/, /sci/, /soc/, /sp/, /tg/, /toy/,
 /trv/, /tv/, /vp/, /wsg/, /x/
$ b v
Last active threads in /v/:
-- #242348757 --  Anonymous  05/05/14(Mon)14:57:43 -----------------
Characters who were right?

191 replies, 62 images.

-- #242362431 -- Aaaaaaa Anonymous  05/05/14(Mon)17:00:56 ----------
What the fuck is this nonsense?
This is the worst thing ever.
Everything depends on RNG in order for you to do anything.
But...
I feel compelled to beat it.
Anyone got any tips for this thing?

30 replies, 5 images.

-- #242366435 --  Anonymous  05/05/14(Mon)17:36:58 -----------------
How did we go from this...

18 replies, 4 images.

-- #242366204 --  Anonymous  05/05/14(Mon)17:34:31 -----------------
Anymore bright ideas like this one in store?

7 replies, 2 images.

-- #242366873 --  Anonymous  05/05/14(Mon)17:40:47 -----------------
Is there ANYTHING about this game that /v/ likes or will it forever be looked upon as unfu
nny memespouting SJW crap? Seriously, anything good at all?

1 replies, 1 images.

-- #242366969 --  Anonymous  05/05/14(Mon)17:41:32 -----------------
D-did I do g-good /v/

1 replies, 1 images.

-- #242357778 --  Anonymous  05/05/14(Mon)16:19:40 -----------------
How old are you /v/.

Do you think it's appropriate for someone your age to have videogames as a full time hobby?

110 replies, 17 images.

-- #242347452 --  Loreguy !V.4kqbM3JY  05/05/14(Mon)14:45:19 -------
Vampire: The Masquerade - Bloodlines thread

Previous thread: 
>>242323815

476 replies, 142 images.

-- #242349936 --  Anonymous  05/05/14(Mon)15:09:59 -----------------
I was gonna do a God Hand mosaic, but that game got horrible reviews. So here's a mosaic o
f a much better IGN-certified game. 
Let's get this going.

288 replies, 96 images.

-- #242361612 -- EUROGAMER CONFIRMS 1080p/60frames on MK8!!! Anonymous  05/05/14(Mon)16:53
:38 
Sony haters can leave via that exit on your left!

http://mynintendonews.com/2014/05/05/eurogamer-confirms-mario-kart-8-is-1080p-and-60fps-ev
en-in-two-player-split-screen/

<Smugfuck>

133 replies, 35 images.

-- #242337603 --  Anonymous  05/05/14(Mon)13:09:04 -----------------
SEGA suddenly becomes a ton less stupid and creates a full release Sonic fighting game tha
t isn't a DS smash clone or a reskin of a reskin of virtua fighter.

What developer would you want to make it and what characters would you like to be in it?

389 replies, 141 images.

-- #242362862 -- Draw Thread! Anonymous  05/05/14(Mon)17:04:45 -----
Drawthread, let's go!

-Post references
-Try not to bump requests
-Keep it vidya
-If a post breaks the rules, DO report and hide it. DON'T respond to it.
-Have fun, dammit

Post your art to the booru for anons to find later in case they miss a delivery or NSFW de
livery:
http://vidyart.booru.org/
http://pastebin.com/iRsqXbQh

Steam:
http://steamcommunity.com/groups/v-drawfags


Comment too long. Click here to view the full text.

76 replies, 58 images.

-- #242340338 --  Anonymous  05/05/14(Mon)13:35:10 -----------------
ITT we make our own /v/idya comics

Be creative. Show everyone how it's done..!

Old thread
>>242317848

164 replies, 79 images.

-- #242351307 --  Anonymous  05/05/14(Mon)15:22:42 -----------------
BATTLESTATION THREAD

POST EM

POVERTY AND CONSOLEFAGS WELCOME

384 replies, 137 images.

-- #242355696 -- DRAGON AGE 3: CISQUISTION AND RED Anonymous  05/05/14(Mon)16:01:47 
Turns out that copy pasta about RED TEMPLARS was more than a shitty joke. /v/ was right ye
t again.
http://dragonagegreywardenshaven.tumblr.com/post/84843766364/dragon-age-inquisition-gamein
former-june-2014

>you find a corrupted army of templars powered by RED LYRIUM

263 replies, 44 images.

$ t v 242366204
Thread /v/242366204:
-- #242366204 --  Anonymous  05/05/14(Mon)17:34:31 -----------------
http://i.4cdn.org/v/1399325671314.jpg
Anymore bright ideas like this one in store?

-- #242366370 --  Anonymous  05/05/14(Mon)17:36:21 -----------------
>>242366204
There's another instance of this in spidertown

-- #242366487 --  Anonymous  05/05/14(Mon)17:37:27 -----------------
>>242366204
did you not notice the bonfire in a prison cell that is surrounded by those exploding guys
.

-- #242366558 --  Anonymous  05/05/14(Mon)17:38:15 -----------------
Yep, and I'm glad so I get to hear scrubs like you get butthurt over it

-- #242366721 --  Anonymous  05/05/14(Mon)17:39:44 -----------------
>>242366204
Just fucking run to the ladder like you're supposed to, problem solved.

You're just nitpicking like that matosisfaggot.

-- #242366850 --  Anonymous  05/05/14(Mon)17:40:36 -----------------
It took damn near 2 minutes for me to wipe out the bonfire enemies.

-- #242366919 --  Anonymous  05/05/14(Mon)17:41:10 -----------------
http://i.4cdn.org/v/1399326070795.jpg
>>242366721
>you can just run down the ladder

No shit, doesn't make it any less retarded.

-- #242367056 --  Anonymous  05/05/14(Mon)17:42:12 -----------------
>>242366204
Save yourself future bother and just keep killing them until they top spawning.

-- #242367218 --  Anonymous  05/05/14(Mon)17:43:34 -----------------
>>242366919
Nitpicking like matosis = beyond retarded

Also very nerdy and no-life move.

I can just imagine you going "buh... buh...buh MAH GAME DESIGN BUBUBUBUBUH MAH FROM..!

$ i v 242362431
Images from thread /v/242362431:
http://i.4cdn.org/v/1399323656375.jpg
http://i.4cdn.org/v/1399324604809.jpg
http://i.4cdn.org/v/1399325165162.jpg
http://i.4cdn.org/v/1399325419165.jpg
http://i.4cdn.org/v/1399326095765.png

$ q
See you.
Connection closed by foreign host.
```

Todo
----

  * more boards support
  * replies to threads (all heil aalib!)
  * improve terminal behavior

License
-------

[WTFPL](http://www.wtfpl.net/)