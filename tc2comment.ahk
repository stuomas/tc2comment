;
; AHK script to comment/uncomment selection with a shortcut key especially in TwinCAT 2.
; Uses the clipboard to temporarily copy selected text, modify it, paste it, and restore
; the old clipboard contents automatically.
;

;Specify a shortcut key, default ctrl + <
^<::

;Comment start and end marks
startMark := "(*"
endMark := "*)"

;Active only in TwinCAT2/Codesys
if !WinActive("ahk_class CoDeSys_Frame")
  return

oldClipboard := ClipboardAll
Clipboard := ""
Send, ^c
ClipWait, 1
if (!ErrorLevel) {
  if InStr(Clipboard, startMark) && InStr(Clipboard, endMark)
    removeComments()
  else
    addComments()
} else
    return

addComments() {
  global startMark
  global endMark
  global oldClipboard
  Clipboard := startMark . Clipboard . endMark
  Sleep, 200
  Send, ^v
  Sleep, 200
  Clipboard := oldClipboard
  return
}

removeComments() {
  global startMark
  global endMark
  global oldClipboard
  Clipboard := StrReplace(Clipboard, startMark, "")
  Clipboard := StrReplace(Clipboard, endMark, "")
  Sleep, 200
  Send, ^v
  Sleep, 200
  Clipboard := oldClipboard
  return
}
