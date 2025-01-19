@echo off
setlocal enabledelayedexpansion

:: Create the target folder if it doesn't exist
if not exist jamesrenders (
    mkdir jamesrenders
)

:: Change this to the relative or absolute path of the file in the repository
set filePath=Characters/James-render.png

:: Get all commits affecting the file
for /f "delims=" %%C in ('git log --pretty=format:%%H --reverse -- %filePath%') do (
    echo Processing commit %%C...

    :: Extract the file for this commit and save it with the commit hash in the filename
    git show %%C:%filePath% > "jamesrenders\James-render-%%C.png"
)

echo All versions extracted to the "jamesrenders" folder.
pause
