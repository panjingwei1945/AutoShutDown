@echo off 
set addr=10.10.168.1
@ping -n 1 -w 100 %addr% | find "TTL"
IF errorlevel 1 (
goto ping_again
) ELSE (
goto end
)

:ping_again
@ping %addr% | find "TTL"
IF errorlevel 1 (
goto closecomputer
) ELSE (
goto end
)

:closecomputer
shutdown  /s /t 100 /c "Fail to ping 10.10.168.1 ,computer will shutdown in 100s. Cancel command: shutdown /a"

:end
exit