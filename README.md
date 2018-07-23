# tc2comment
AHK script to comment/uncomment a selection with a shortcut key especially in TwinCAT 2, where such built-in functionality is missing. Uses the clipboard to temporarily copy selected text, modify it, paste it, and restore the old clipboard contents automatically.

By default, it wraps the selected block between `(*` and `*)` when pressing `ctrl + <` and is only active inside TwinCAT2/Codesys environment. Modify to your own taste and needs. If the script notices the selection is already commented, it will be uncommented. Making the recognition more clever (to support existing inline comments for example) is on the to-do list.
