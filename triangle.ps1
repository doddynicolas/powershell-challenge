######################################################
######################################################
#### Get-TriangleMissingLength function
######################################################
######################################################
function Get-TriangleMissingLength {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$SideA,
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$SideB,
        [Parameter(Mandatory)]
        [ValidateScript({$_ -gt 0 -and $_ -lt 180})]
            [decimal]$Angle
    )
    
    begin {
        
    }
    
    process {
        $missingSideLengthCalc = [math]::Pow($SideA,2) + [math]::Pow($SideB,2) - 2 * $SideA * $SideB * [math]::Cos($Angle/180*[math]::PI)
        $missingSideLength = [math]::Sqrt($missingSideLengthCalc)
    }
    
    end {
        Write-Output -InputObject $missingSideLength
    }
}

######################################################
######################################################
#### Get-AreaOfCircle function
######################################################
######################################################
function Get-AreaOfCircle {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$Radius
    )
    
    begin {
        
    }
    
    process {
        $area = [math]::PI * [math]::Pow($Radius,2)
    }
    
    end {
        Write-Output -InputObject $area
    }
}

######################################################
######################################################
#### Get-VolumeOfSphere function
######################################################
######################################################
function Get-VolumeOfSphere {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$Radius
    )
    
    begin {
        
    }
    
    process {
        $volume = 4 / 3 * [math]::PI * [math]::Pow($Radius,3)
    }
    
    end {
        Write-Output -InputObject $volume
    }
}

######################################################
######################################################
#### Get-VolumeOfCylinder function
######################################################
######################################################
function Get-VolumeOfCylinder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$Height,
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [decimal]$Radius
    )
    
    begin {
        
    }
    
    process {
        $volume = $Height * [math]::PI * [math]::Pow($Radius,2)
    }
    
    end {
        Write-Output -InputObject $volume
    }
}

######################################################
######################################################
#### Get-Factorial function
######################################################
######################################################
function Get-Factorial {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateRange("Positive")]
            [int]$Number
    )
    
    begin {
        
    }
    
    process {
        $factorial = Invoke-Expression (1..$Number -join '*')
    }
    
    end {
        Write-Output -InputObject $factorial
    }
}

# Testing each function:

Get-TriangleMissingLength -SideA 3.1 -SideB 4.9921 -Angle 90.03

Get-AreaOfCircle -Radius 22

Get-VolumeOfSphere -Radius 8

Get-VolumeOfCylinder -Height 10 -Radius 5

Get-Factorial -Number 9