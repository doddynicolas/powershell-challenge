function ConvertTo-Celsius {
    param($Fahrenheit)
    ($Fahrenheit - 32) * 5/9
}

function ConvertTo-Fahrenheit {
    param($Celsius)
    ($Celsius * 9/5) + 32
}

function ConvertTo-Celsius2 {
    param($Fahrenheit)
    process {
        [PsCustomObject]@{
            Fahrenheit = $Fahrenheit
            Celsius = ($Fahrenheit - 32) * 5/9
        }
    }
}

function ConvertTo-Fahrenheit2 {
    param($Celsius)
    process {
        [PsCustomObject]@{
            Celsius = $Celsius
            Fahrenheit = ($Celsius * 9/5) + 32
        }
    }
}

function ConvertTo-Celsius3 {
    param(
        [Parameter(ValueFromPipeline,Position=0)]
        [decimal[]]$Fahrenheit,
        [ValidateRange(0,28)]
        [int]$Precision = 1
    )
    process {
        foreach ($Temperature in $Fahrenheit) {
            if ($Temperature -ge -459.67) {
                [PsCustomObject]@{
                    Fahrenheit = $Temperature
                    Celsius = [math]::Round(($Temperature - 32) * 5/9,$Precision)
                }
            } else {
                '{0} {1}F is below absolute zero. Please try again.' -f $Temperature,[char]176 | Write-Warning
            }
        }
    }
}

function ConvertTo-Fahrenheit3 {
    param(
        [Parameter(ValueFromPipeline,Position=0)]
        [decimal[]]$Celsius,
        [ValidateRange(0,28)]
        [int]$Precision = 1
    )
    process {
        foreach ($Temperature in $Celsius) {
            if ($Temperature -ge -273.15) {
                [PsCustomObject]@{
                    Celsius = $Temperature
                    Fahrenheit = [math]::Round(($Temperature * 9/5) + 32,$Precision)
                }
            } else {
                '{0} {1}F is below absolute zero. Please try again.' -f $Temperature,[char]176 | Write-Warning
            }
        }
    }
}