
<#PSScriptInfo

.VERSION 1.0.0

.GUID 407a3e9f-5589-48fe-ae8a-be0434721be8

.AUTHOR Tigran TIKSN Torosyan

.COMPANYNAME tiksn.com

.COPYRIGHT VerdantApp 2022

.TAGS

.LICENSEURI https://github.com/VerdantApp/Scripts/blob/main/LICENSE

.PROJECTURI https://github.com/VerdantApp/Scripts/

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

#Requires -Module Microsoft.PowerShell.Management
#Requires -Module SecretManagement.Keybase

<# 

.DESCRIPTION 
 Set connection string 

#> 
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [Security.SecureString]
    $Password
)

$plainTextPassword = $Password | ConvertFrom-SecureString -AsPlainText

$plainTextConnectionString = "mongodb+srv://VerdantApp:$plainTextPassword@cluster0.1mjlbhi.mongodb.net/VerdantApp?retryWrites=true&w=majority"

$secureConnectionString = $plainTextConnectionString | ConvertTo-SecureString -AsPlainText -Force

Set-Secret -Name 'VerdantApp-ConnectionString' -Vault 'VerdantApp' -SecureStringSecret $secureConnectionString
