MagicPressAndHold is a [SIMBL][] plugin that lets you extend Mac OS X Lion's "press-and-hold" input method to generate accented characters in standard text views. That is, you can provide your own "press-and-hold" choices for the keys of your choice.

Currently, the choices are provided in the `com.belkadan.MagicPressAndHold` defaults. You can add accent choices from the command line:

	defaults write com.belkadan.MagicPressAndHold Accents -dict-add e '("e\U0304", "e\U0301", "e\U030c", "e\U0300")'

Note that the expansions can contain more than one Unicode character, as shown here, and that non-ASCII characters should be represented using their UTF-16 codepoints. You can also create/edit the defaults property list yourself (`~/Library/Preferences/com.belkadan.MagicPressAndHold.plist`), in which case no escaping is necessary.

Known problems:

- SIMBL doesn't recognize the PressAndHold.app input method. Because it is launched using `launchd`, rather than as a normal application, NSWorkspace doesn't get any notifications about it. Current workaround is to manually send the SIMBL loading event to PressAndHold using the little AppleScript applet.
- PressAndHold only considers certain keys to be interesting. This shouldn't be hard to override, but it is something that has to be done.
- No preferences UI.

  [SIMBL]: http://www.culater.net/software/SIMBL/SIMBL.php
