function Get-SystemInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
        [Alias('hostname')]
        [string[]]$ComputerName,
        
        [string]$ErrorLog   
    )
    BEGIN {
    }
    PROCESS {
        foreach ($computer in $computername) {
            $os = Get-CimInstance -class Win32_OperatingSystem `
                                -computerName $computer
            $comp = Get-CimInstance -class Win32_ComputerSystem `
                                  -computerName $computer
            $bios = Get-CimInstance -ClassName win32_bios `
                                  -ComputerName $computer
            $props = @{'Host Name'=$computer;
                       'OS'=$os.caption;
                       'OS Version'=$os.version;
                       'Serial'=$bios.serialnumber;
                       'BIOS Revision'=$bios.SMBIOSBIOSVersion
                       'Manufacturer'=$comp.manufacturer;
                       'Model'=$comp.model}
            $obj = New-Object -TypeName PSObject -Property $props
            Write-Output $obj
        }
    }
    END {}
}
#Get-SystemInfo -ErrorLog x.txt -ComputerName localhost,4122ks-9010