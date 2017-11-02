package js.xterm;

#if js

typedef TerminalOptions = {
    /**
     *  Whether the terminal cursor blinks
     */
    var cursorBlink:Bool;
    
    /**
     *  The number of columns of the terminal (horizontal size).
     */
    var cols:Int;
    
    /**
     *  The number of rows of the terminal (vertical size).
     */
    var rows:Int;
    
    /**
     *  The number of rows to be persisted in terminal buffer for scrolling (default: `1000`).
     */
    @:optional var scrollBack:Int;
    
    /**
     *  The number of columns a tab stop should occupy (default: `8`).
     */
    @:optional var tabStopWidth:Int;
}

@:enum abstract TerminalOptionKey(String) {
    var cursorBlink = "cursorBlink";
    var cols = "cols";
    var rows = "rows";
    var scrollBack = "scrollBack";
    var tabStopWidth = "tabStopWidth";
}

#end
