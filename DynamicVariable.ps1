
#region Example 1 (using [Diagnostics.Stopwatch])
function Now 
{
    if ($Variable:stopWatch){
        "$('{0:D2}' -f $StopWatch.Elapsed.hours):$('{0:D2}' -f $StopWatch.Elapsed.minutes):$('{0:D2}' -f $StopWatch.Elapsed.seconds)"
    }
}

$stopWatch = [Diagnostics.Stopwatch]::StartNew()
Write-Host "[$(now)] Bingo"
$stopWatch.Stop()
#endregion Example 1

#region Example 2 (using New-Object)
# Inspiration: 
# http://powershell.com/cs/blogs/tips/archive/2016/08/16/creating-dynamic-variable-content2.aspx?utm_source=twitterfeed&utm_medium=twitter
$startTime = Get-Date

$info = New-Object -TypeName PSObject
$info | Add-Member -Name Now -MemberType ScriptProperty -Value { Get-Date }
$info | Add-Member -Name TimeStamp -MemberType ScriptProperty -Value { 
	$timediff = (Get-Date) - $startTime
	"$('{0:D2}' -f $timediff.Hours):$('{0:D2}' -f $timediff.Minutes):$('{0:D2}' -f $timediff.Seconds):$('{0:D3}' -f $timediff.Milliseconds)"
}

Write-Host "[$($info.TimeStamp)] Bingo"	
#eller
Write-Host "[$($info.Now)] Bingo"	
#endregion Example 2