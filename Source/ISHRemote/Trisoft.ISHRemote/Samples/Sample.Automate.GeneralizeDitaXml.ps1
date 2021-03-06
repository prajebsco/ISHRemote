CLS
Write-Host "`r`nImport-Module ISHRemote..."
Import-Module ISHRemote -DisableNameChecking 
 
Write-Host "`r`nSetting preferences..."
$DebugPreference   = "Continue"   # Continue or SilentlyContinue
$VerbosePreference = "SilentlyContinue"   # Continue or SilentlyContinue
$WarningPreference = "Continue"   # Continue or SilentlyContinue or Stop

Write-Host "`r`nThis sample script will process all DITA xml files in the input folder and will generalize all DITA files either to Topic or Map."
Write-Host "`r`nNote that ditabase and ditaval are not supported."
Write-Host "`r`nNote that the xmls in the input folder needs to have a DOCTYPE."

try
{	
	Write-Host "`r`nStarting..."

	Write-Host "Setting current directory..."
	[string]$currentScriptDirectory = split-path -parent $MyInvocation.MyCommand.Definition
	Set-Location $currentScriptDirectory
	[Environment]::CurrentDirectory=$currentScriptDirectory

	# Input folder with the specialized xmls to generalize.
	$inputfolder = "Data-GeneralizeDitaXml\InputFiles"	
	# Output folder with the generalize xmls. The successfully generalized files will get a .gen extension, the failed ones will get .err with a .log file next to them why they failed.
	$outputfolder = "Data-GeneralizeDitaXml\OutputFiles"    # !This folder will be deleted if it already exists!
	
	# Location of the catalog xml that contains the specialized dtds
	$specializedCatalogLocation = "Data-GeneralizeDitaXml\SpecializedDTDs\catalog-alldita12dtds.xml"
	# Location of the catalog xml that contains the "base" dtds
    $generalizedCatalogLocation = "Data-GeneralizeDitaXml\GeneralizedDTDs\catalog-dita12topic&maponly.xml";
	# File that contains a mapping between the specialized dtd and the according generalized dtd.
    $generalizationCatalogMappingLocation = "Data-GeneralizeDitaXml\generalization-catalog-mapping.xml"
	# If you would have specialized attributes from the DITA 1.2 "props" attribute, specify those attributes here to generalize them to the "props" attribute again.  Here just using modelyear, market, vehicle as an example
	$attributesToGeneralizeToProps = @("modelA", "modelB", "modelC")
	# If you would have specialized attributes from the DITA 1.2 "base" attribute, specify those attributes here to generalize them to the "base" attribute again. Here just using basea, baseb, basec as an example
	$attributesToGeneralizeToBase = @("basea", "baseb", "basec")

	if (Test-Path $outputfolder)
	{
		Remove-Item $outputfolder -Recurse
	}
	
	# First we will copy all the files of the inputfolder to the outputfolder recursively
	Copy-Item -Path $inputfolder -Destination $outputfolder -recurse -force
	
	# Read all the xml files to process from the outputfolder
	$filesToProcess = get-childItem $outputfolder -include *.xml -recurse
	
	# Generalize all the files in the outputfolder
	# The successfully generalized files will get a .gen extension, the failed ones will get .err with a .log file next to them why they failed.	
	$filesToProcess | Generalize-DitaXml `
							-SpecializedCatalogLocation $SpecializedCatalogLocation `
						   -GeneralizedCatalogLocation $GeneralizedCatalogLocation `
						   -GeneralizationCatalogMappingLocation $GeneralizationCatalogMappingLocation `
						   -AttributesToGeneralizeToProps $attributesToGeneralizeToProps `
						   -AttributesToGeneralizeToBase $attributesToGeneralizeToBase

}
catch
{
	Write-Host "`r`nException"
    Write-Host "========="
    $Error[0].Exception.Message # $_.Message;
    Write-Host "========="
}
finally
{
    Write-Host "`r`nRemove-Module ISHRemote..."
	Remove-Module ISHRemote
}
