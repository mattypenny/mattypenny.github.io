function Generate-SketchnoteHugoPages {
    [CmdletBinding()]
    param (
    
        [string]$ImagesFolder = "c:\matt\website\static\images\sketchnotes",

        [string]$TargetMarkdown = "C:\matt\website\content\sketchnotes"
    )
    
    $DebugPreference = $PSCmdlet.GetVariableValue('DebugPreference')
    
    write-startfunction
    
    foreach ($F in $(dir -recurse $ImagesFolder -exclude .git,scan*,Visual* )) {

        $Name = $F.Name

        $Fullname = $F.Fullname

        get-HugoPageTitleFromImageFileName -fullname $Fullname

        get-HugoImageLinkFromImageFileName -fullname $Fullname -option html
        
    
        <#
            Link needs to look like this:

            <a href="/images/sketchnotes/powershell/Why%20Powershell%20PC.jpg"><img src="/images/sketchnotes/powershell/Why%20Powershell%20PC.jpg" alt="Sketchnote of Why Powershell PC">
        #>
        $MdString = @"
---
title: "$Title"
date: 2020-01-08T17:21:18Z
draft: false
hidden: true
---
$Link
"@

        $TargetMdFile = $Name -replace ' ','-'

        $TargetMdFolder = [System.IO.Path]::GetDirectoryName($Fullname)
        
        $TargetMdFolder = $TargetMdFolder -replace "$ReplaceSourceFolderString", "$TargetMarkdown"

        mkdir -force $TargetMdFolder
        $TargetMdFullname = "$TargetMDFolder\$TargetMDFile"

        $TargetMdFullName = $TargetMdFullname.split('.')[0]

        $TargetMdFullname = "$TargetMdFullname.md"

        Write-Output "set-content -path $TargetMdFullName -Value `$MdString (with link $Link)"

        set-content -Path $TargetMdFullname -Value $MdString

    }
    
    write-endfunction
    
    
}



 
function get-HugoPageTitleFromImageFileName  {
    [CmdletBinding()]
    param (
        $Fullname
    )
    
    $DebugPreference = $PSCmdlet.GetVariableValue('DebugPreference')
    
    write-startfunction
    

    
    [string]$FilenameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($Fullname)

    
    
    write-endfunction
        
}

function get-HugoImageLinkImageFileName  {
    [CmdletBinding()]
    param (
        $Fullname,

        [ValidateSet('Html')]$ImageLinkStyle
    )
    
    $DebugPreference = $PSCmdlet.GetVariableValue('DebugPreference')
    
    write-startfunction
    $ReplaceTargetFolderString = [Regex]::Escape("c:\matt\website\static")
        
    $URLName = $TargetName -replace $ReplaceTargetFolderString,''
        
    $URLname = $URLName -replace " ","%20"
    $URLName = $URLName -replace '\\','\/'

    write-endfunction
        
}