package js.xterm;

#if js

@:enum abstract TerminalEvent(String) {
    /**
     *  Emitted when the terminal blurs (loses focus).
     */
    var blur = "blur";

    /**
     *  Emitted when a chunk of data is being dispatched to the terminal for handling.
     */
    var data = "data";

    /**
     *  Emitted when the terminal gets focus.
     */
    var focus = "focus";

    /**
     *  Emitted when the terminal handles a keydown or keypress event.
     */
    var key = "key";

    /**
     *  Emitted after a keydown event on the terminal.
     */
    var keydown = "keydown";

    /**
     *  Emitted after a keypress event on the terminal.
     */
    var keypress = "keypress";

    /**
     *  Emitted when the terminal gets a line feed or new line character.
     */
    var lineFeed = "lineFeed";

    /**
     *  Emitted when the terminal gets opened in a DOM element.
     */
    var open = "open";

    /**
     *  Emitted when the terminal gets a content refresh (re-render).
     */
    var refresh = "refresh";

    /**
     *  Emitted when the terminal gets resized to a new geometry.
     */
    var resize = "resize";

    /**
     *  Emitted when the terminal scrolls vertically. This event can be emitted manually to synchronize the scroll bar, this is useful if the terminal was resized while it was display: none.
     */
    var scroll = "scroll";

    /**
     *  Emitted when the terminal’s title get updated via the appropriate xterm escape sequence.
     */
    var title = "title";
}

#end