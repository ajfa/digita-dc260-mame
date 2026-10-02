Kodak DC260 with Digita OS in MAME, for Windows
===============================================

The Kodak DC260 Zoom digital camera, from 1998, with its Digita operating
system (by FlashPoint Technology) in Kodak's firmware 1.0.2. Inside it is a
PowerPC MPC823 at 49 MHz with 8 MB of RAM, 2 MB of flash and VxWorks 5.3
under Digita. The whole camera is emulated and runs its original firmware,
untouched.

Everything needed is inside this folder. Nothing to install.


WHAT TO OPEN
------------

  CAMERA.bat            The camera with its CompactFlash card. What you do
                        on the card is kept for next time.

  TETRIS.bat            The camera starts straight into Digita Tetris 1.0
                        (Edgar Lee, 1998). A fresh card every time.

  DOOM.bat              The camera starts straight into DoomD, the Doom for
                        Digita cameras, with the shareware DOOM1.WAD
                        (episode 1, "Knee-Deep in the Dead"). A fresh card
                        every time.

  START-OVER.bat        Deletes the card and the camera settings (date,
                        preferences) and puts everything back the way it
                        came. Asks first.

The camera takes about 15 seconds to turn its screen on.

AFTER ABOUT A MINUTE WITHOUT PRESSING ANYTHING THE SCREEN GOES BLACK. The
camera is not frozen: it turns its screen off to save batteries, like the
real one. F3 restarts it if you need to.

The camera's clock takes the PC's date and time the first time and then
keeps counting even when MAME is closed, like the battery-backed clock of the
real one.


HOW TO USE IT
-------------

  Arrows           The camera's four-way button.
  M                The Menu button.
  1  2  3          The three keys under the screen (left, middle, right).
                   What each one does is written on the screen above it:
                   Enter, Start, Cancel, Done...
  O                Turns the camera on when it is off.
  F3               Restarts the camera (like taking the batteries out and
                   putting them back).
  Tab              MAME's menu.
  Esc              Closes MAME.

THE MODE DIAL. The camera has a wheel to choose the mode. It is changed in
Tab > Machine Configuration > Mode dial:

  Review           Review pictures. The mode it starts in. It says "No
                   Pictures in Camera", which is true: the card comes empty.
                   M opens the menus: albums, preferences, camera to camera
                   and applications.

  Capture          Take pictures. THE SCREEN STAYS BLACK, AND THAT IS RIGHT:
                   on the real camera the screen is off while taking pictures
                   to save batteries. M brings up the capture menus (picture
                   type, album, white balance, watermark) and M again turns
                   it off.

  Connect          Connection to a computer. Black screen: the camera waits
                   for the cable, which is not emulated.

  Brag Book        Shows the screen with the firmware version.


APPLICATIONS
------------

Digita applications are started from the camera (CAMERA.bat):

  1. In Review mode press M.
  2. With the right arrow go to the last tab, the blue floppy,
     "Applications". TETRIS.CAM appears.
  3. Press 1 (Start). THE SCREEN GOES OFF, AND THAT IS RIGHT: the camera
     turns itself off to start the application.
  4. Press O to turn it on. Tetris starts.

In Tetris: 1 starts (Begin, Start); while playing, the arrows move the piece,
1 rotates it, 2 pauses and 3 quits the game. M goes to the title screen.
Tetris has no option to go back to the camera, just like on the real one,
where you had to switch it off: press F3 and the camera starts normally again.


DOOM
----

In less than 10 seconds Doom's title appears, then the demo, which plays on
its own. To start playing: M opens Doom's menu, Enter picks "New Game",
Enter picks the episode and Enter picks the difficulty.

  Arrows          Walk and turn.
  Left Ctrl       Fire.
  Space           Use: open doors, press switches.
  2               Run (hold it while walking).
  3               Map.
  M               Doom's menu (Esc in PC Doom).
  Enter           Pick in the menu; also the "yes" (y) to Doom's questions.
  -  =            Smaller or larger view.

Those keys are camera buttons: the DC260 had no keyboard and Doom for cameras
was played with the four-way button and the camera's buttons. There is no way
to change weapons by hand: Doom switches on its own when you pick a new one.

SAVING THE GAME. DOOM.bat starts from a clean card every time, so what you
save from Doom's menu is lost when you close it. To really save use MAME's
slots, which save the whole camera with the game inside:

  Shift + F7, then a number or letter   Save in that slot.
  F7, then the same number or letter    Go back to that moment.

They are kept in the savestates folder and stay there after MAME closes.

When it starts, the camera's loader complains internally about some
functions it cannot find. It is not shown on screen and Doom starts anyway:
Doom for cameras was made for several models and looks for each one's
functions.


WHAT DOES NOT WORK
------------------

  - Taking pictures. The image sensor is not emulated.
  - Sound.
  - The other applications of the original package (calculator, Sokoban,
    minesweeper, MP3...) have not been tried properly.
  - Some camera buttons are not identified yet: the shutter, the zoom and
    those of the status panel on top.


HOW TO SHUT DOWN WITHOUT DAMAGING ANYTHING
------------------------------------------

The card is written as you go. To avoid leaving it half written:

  - Close the window (or press Esc) when the camera is idle on a screen or a
    menu.
  - Do not close it right after pressing Start in Applications, nor while it
    deletes or creates albums: at those moments it is writing to the card.

If something breaks, START-OVER.bat puts everything back the way it came.


WHAT IS KEPT WHERE
------------------

  state\           The camera's card and its settings. Created the first
                   time you open the camera.
  snapshots\       Screenshots (MAME's F12 key).
  savestates\      MAME save slots from DOOM.bat.
  cards-original\  The clean cards the others are copied from.
