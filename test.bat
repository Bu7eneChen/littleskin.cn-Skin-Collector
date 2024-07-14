::@echo off

mkdir raw
cd raw

set id=408858

:loop
set "url=https://littleskin.cn/skinlib/show/%id%"
set "char='£¬','-'"
powershell -c "if((Invoke-WebRequest -UseBasicParsing -Uri '%url%').Content -match '(?<=<title>).*?(?=</title>)'){$Matches[0].Split(@(%char%))[0]}" >title.txt
curl -O https://littleskin.cn/raw/%id%

set /p name=<title.txt

ren %id% "%name%".png
set /a id=%id%+1
echo %id%

goto loop
pause&exit