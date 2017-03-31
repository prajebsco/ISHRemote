﻿Write-Host ("`r`nLoading ISHRemote.PesterSetup.ps1 for MyCommand[" + $MyInvocation.MyCommand + "]...")
. (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "..\..\ISHRemote.PesterSetup.ps1")
$cmdletName = "Add-IshOutputFormat"
try {

Describe "Add-IshOutputFormat" -Tags "Create" {
	Write-Host "Initializing Test Data and Variables"
	
	Context "Add-IshOutputFormat ParameterGroup" {
		It "Parameter IshSession invalid" {
			{ Add-IshOutputFormat -IShSession "INVALIDISHSESSION" -Name "INVALIDOUTPUTFORMATNAME" } | Should Throw
		}
	}

	Context "Add-IshOutputFormat ParameterGroup" {
		It "GetType().Name" {
			$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " Name")
			$metadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			            Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element -Value $ishResolution
			$ishObject = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
			$ishObject.GetType().Name | Should BeExactly "IshObject"
			$ishObject.Count | Should Be 1
		}
		It "Parameter Metadata" {
			$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " Metadata")
			$metadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			            Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element -Value $ishResolution
			$ishObject = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
			$ishObject.Count | Should Be 1
			$ishObject.IshRef -Like "VOUTPUTFORMAT*" | Should Be $true
		}
		It "Parameter Metadata return descriptive metadata" {
			$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " Metadata")
			$metadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			            Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHOBJECTACTIVE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element -Value $ishResolution
			$ishObject = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
			(Get-IshMetadataField -IshSession $ishSession -IshObject $ishObject -Name "FISHOUTPUTFORMATNAME" -Level None).Length -gt 1 | Should Be $true
		}
		It "Parameter Metadata StrictMetadataPreference=Off" {
		    $strictMetadataPreference = $ishSession.StrictMetadataPreference
			$ishSession.StrictMetadataPreference = "Off"
			$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " Metadata")
			$metadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			            Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHOBJECTACTIVE" -Level None -Value "TRUE" |
						Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element -Value $ishResolution |
						Set-IshMetadataField -IshSession $ishSession -Name "CREATED-ON" -Level None -Value "19/03/2017" | 
						Set-IshMetadataField -IshSession $ishSession -Name "MODIFIED-ON" -Level None -Value "19/03/2017" |
						Set-IshMetadataField -IshSession $ishSession -Name "READ-ACCESS" -Level None -Value "SomethingReadAccess"  |
						Set-IshMetadataField -IshSession $ishSession -Name "OWNER" -Level None -Value "SomethingOwner" |
						Set-IshMetadataField -IshSession $ishSession -Name "INVALIDFIELDNAME" -Level None -Value "SomethingInvalidFieldName"
			{ Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP" } | Should Throw
			$ishSession.StrictMetadataPreference = $strictMetadataPreference
		}
	}

	Context "Add-IshOutputFormat IshObjectsGroup" {
	    $metadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			        Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
					Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
					Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
					Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element -Value $ishResolution
		$requestedMetadata = Set-IshMetadataField -IshSession $ishSession -Name "FISHCLEANUP" -Level None -Value "TRUE" |
			                 Set-IshMetadataField -IshSession $ishSession -Name "FISHKEEPDTDSYSTEMID" -Level None -Value "TRUE" |
							 Set-IshMetadataField -IshSession $ishSession -Name "FISHPUBRESOLVEVARIABLES" -Level None -Value "TRUE" |
							 Set-IshMetadataField -IshSession $ishSession -Name "FISHSINGLEFILE" -Level None -Value "TRUE" |
					         Set-IshMetadataField -IshSession $ishSession -Name "FISHRESOLUTIONS" -Level None -ValueType Element |
							 Set-IshMetadataField -IshSession $ishSession -Name "FISHOUTPUTEDT" -Level None -ValueType Element
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " A")
		$ishObjectA = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " B")
		$ishObjectB = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP" | 
		              Get-IshOutputFormat -IshSession $ishSession -RequestedMetadata $requestedMetadata
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " C")
		$ishObjectC = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " D")
		$ishObjectD = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP" | 
		              Get-IshOutputFormat -IshSession $ishSession -RequestedMetadata $requestedMetadata
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " E")
		$ishObjectE = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP"
		$outputFormatName = ($cmdletName + " " + (Get-Date -Format "yyyyMMddHHmmssfff") + " F")
		$ishObjectF = Add-IshOutputFormat -IshSession $ishSession -Name $outputFormatName -Metadata $metadata -Edt "EDTZIP" | 
		              Get-IshOutputFormat -IshSession $ishSession -RequestedMetadata $requestedMetadata
		Remove-IshOutputFormat -IshSession $ishSession -IshObject @($ishObjectA,$ishObjectB,$ishObjectC,$ishObjectD,$ishObjectE,$ishObjectF)
		Start-Sleep -Milliseconds 1000  # Avoids uniquesness error which only up to the second " Cannot insert duplicate key row in object 'dbo.CARD' with unique index 'CARD_NAME_I1'. The duplicate key value is (VUSERROLEADD-IshOutputFormat20161012164716068A12/10/2016 16:47:16)."
		It "Parameter IshObject invalid" {
			{ Add-IshOutputFormat -IShSession $ishSession -IshObject "INVALIDOUTPUTFORMAT" } | Should Throw
		}
		It "Parameter IshObject Single" {
			$ishObjects = Add-IshOutputFormat -IshSession $ishSession -IshObject $ishObjectA
			$ishObjects | Remove-IshOutputFormat -IshSession $ishSession
			$ishObjects.Count | Should Be 1
		}
		It "Parameter IshObject Multiple" {
			$ishObjects = Add-IshOutputFormat -IshSession $ishSession -IshObject @($ishObjectB,$ishObjectC)
			$ishObjects | Remove-IshOutputFormat -IshSession $ishSession
			$ishObjects.Count | Should Be 2
		}
		It "Pipeline IshObject Single" {
			$ishObjects = $ishObjectD | Add-IshOutputFormat -IshSession $ishSession
			$ishObjects | Remove-IshOutputFormat -IshSession $ishSession
			$ishObjects.Count | Should Be 1
		}
		It "Pipeline IshObject Multiple" {
			$ishObjects = @($ishObjectE,$ishObjectF) | Add-IshOutputFormat -IshSession $ishSession
			$ishObjects | Remove-IshOutputFormat -IshSession $ishSession
			$ishObjects.Count | Should Be 2
		}
	}
}


} finally {
	Write-Host "Cleaning Test Data and Variables"
	$userRoles = Find-IshOutputFormat -IshSession $ishSession -MetadataFilter (Set-IshMetadataFilterField -IshSession $ishSession -Name "FISHOUTPUTFORMATNAME" -FilterOperator like -Value "$cmdletName%")
	try { Remove-IshOutputFormat -IshSession $ishSession -IshObject $userRoles } catch { }
}