#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; 
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines -1 ; run as fast as possible

expectedParmCnt=2
nbrOfParms=%0%

if (nbrOfParms < expectedParmCnt)
{
    MsgBox,%A_ScriptName% requires at least %expectedParmCnt%  incoming parameters but it only received %0%.
    ExitApp
}

taskNm=%1%

if (taskNm == "jira0")
{
    parm=%2%
    url0=https://trellis.atlassian.net/browse/%parm%
    run,%url0%
} else if (taskNm == "copy-work-around") {
    CLIPBOARD=%2%
    SplashTextOn, 100, 50, Zim Copy Workaround, copied to clipboard: %2%
    sleep, 500
    SplashTextOff
}
else 
    msgbox,unknown task: %taskNm%

ExitApp
