on run argv
    tell application "Finder"
                try
                        set _cwd to POSIX path of ((folder of (front window)) as alias)
                on error
                        set _cwd to POSIX path of (path to home folder as alias)
                end try
        end tell


        tell application "iTerm"
                activate               
                 try
                        set _session to current session of current terminal
                on error
                        set _term to (make new terminal)
                        tell _term
                                launch session "Default"
                                set _session to current session
                        end tell
                end try
                tell _session
                        write text "cd \"" & _cwd & "\""
                        write text "git clone \"" & item 1 of argv & "\""
                end tell
        end tell
end run