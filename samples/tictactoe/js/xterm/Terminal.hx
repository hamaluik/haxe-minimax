package js.xterm;

#if js
import js.html.Element;
import js.html.TextAreaElement;
import js.html.KeyboardEvent;

import js.xterm.TerminalOptions.TerminalOptionKey;

@:native('Terminal')
/**
 *  Terminal is the main class of xterm.js. It is used to construct terminal objects and allow programmatic manipulation of them.
 */
extern class Terminal {
    /**
     *  The DOM element that hosts the terminal.
     */
    public var element:Element;

    /**
     *  The textarea element of the terminal that controls all input.
     */
    public var textarea:TextAreaElement;

    /**
     *  Create a new terminal by using the Terminal([options]) constructor.
     *  @param options - 
     */
    public function new(?options:TerminalOptions);

    /**
     *  Attach a custom key event handler to allow consumers to allow certain key strokes to skip processing by the terminal. Return false to prevent xterm.js from processing the the key event.
     *  @param customKeydownHandler - The custom KeyboardEvent handler to attach
     */
    public function attachCustomKeyEventHandler(customKeydownHandler:KeyboardEvent->Void):Void;

    /**
     *  Remove the focus from the terminal.
     */
    public function blur():Void;

    /**
     *  Clears the entire buffer of the terminal, making the prompt line the new first line.
     */
    public function clear():Void;

    /**
     *  Clears the current terminal selection.
     */
    public function clearSelection():Void;

    /**
     *  Destroys the terminal and detaches it from the DOM.
     */
    public function destroy():Void;

    /**
     *  Focus on the terminal
     */
    public function focus():Void;

    /**
     *  Retrieves an option from the terminal.
     *  @param key - The option key
     *  @return Dynamic
     */
    public function getOption(key:TerminalOptionKey):Dynamic;

    /**
     *  Gets the terminal’s current selection, this is useful for implementing copy behavior outside of xterm.js.
     *  @return String
     */
    public function getSelection():String;

    /**
     *  Gets whether the terminal has an active selection.
     *  @return Bool
     */
    public function hasSelection():Bool;

    /**
     *  Attempts to load an add-on using CommonJS or with RequireJS, if CommonJS is not available. If none of them are available, an error is sent to the console.
     *  @param addon - The name of the add-on to load
     *  @param callback - The callback to run after running the add-on
     */
    public static function loadAddon(addon:String, ?callback:Void->Void):Void;

    /**
     *  Attach a callback to run on a specific event.
     *  @param event - The event to attach the callback
     *  @param callback - The callback to run on the event
     */
    @:overload(function(event:TerminalEvent, callback:Void->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:String->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:String->KeyboardEvent->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:KeyboardEvent->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:{element:Element, start:Int, end:Int}->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:{terminal:Terminal, cols:Int, rows:Int}->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:Int->Void):Void {})
    public function on(event:TerminalEvent, callback:Dynamic->Void):Void;

    /**
     *  Stop running a callback on an event.
     *  @param event - The event from which to detach the callback
     *  @param callback - The callback to stop running on the event
     */
    @:overload(function(event:TerminalEvent, callback:Void->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:String->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:String->KeyboardEvent->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:KeyboardEvent->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:{element:Element, start:Int, end:Int}->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:{terminal:Terminal, cols:Int, rows:Int}->Void):Void {})
    @:overload(function(event:TerminalEvent, callback:Int->Void):Void {})
    public function off(event:TerminalEvent, callback:Dynamic->Void):Void;

    /**
     *  Open the terminal into the given parent element.
     *  @param parent - The DOM element to host the terminal
     *  @param focus - Focus the terminal, after it gets instantiated in the DOM
     */
    public function open(parent:Element, focus:Bool):Void;

    /**
     *  Refresh (re-render) the terminal content between two rows (inclusive).
     *  @param start - The first row to be refreshed
     *  @param end - The last row to be refreshed
     *  @param queue - Queue the refresh to run asynchronously, when it’s more optimal
     */
    public function refresh(start:Int, end:Int, queue:Bool):Void;

    /**
     *  Reset the terminal; reconstruct the instance and re-render the whole buffer.
     */
    public function reset():Void;

    /**
     *  Resize the geometry of the terminal.
     *  @param x - The number of columns to set to the terminal
     *  @param y - The number of rows to set to the terminal
     */
    public function resize(x:Int, y:Int):Void;

    /**
     *  Scroll the terminal by a number of lines.
     *  @param n - The number of rows to scroll down (or up if negative)
     */
    public function scrollDisp(n:Int):Void;

    /**
     *  Scroll the terminal by a number of pages.
     *  @param n - The number of pages to scroll down (or up if negative)
     */
    public function scrollPages(n:Int):Void;

    /**
     *  Scrolls the terminal to the top of the buffer.
     */
    public function scrollToTop():Void;

    /**
     *  Scrolls the terminal to the bottom of the buffer.
     */
    public function scrollToBottom():Void;

    /**
     *  Selects all text within the terminal.
     */
    public function selectAll():Void;

    /**
     *  Sets an option on the terminal.
     *  @param key - The option key
     *  @param value - The option value
     */
    public function setOption(key:TerminalOptionKey, value:Dynamic):Void;

    /**
     *  Writes the given text to the terminal.
     *  @param text - The text to write to the terminal.
     */
    public function write(text:String):Void;

    /**
     *  Writes the given text to the terminal, followed by a line break (`\n`).
     *  @param text - The text to write to the terminal.
     */
    public function writeln(text:String):Void;
}

#end