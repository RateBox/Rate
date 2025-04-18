param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('set', 'generate', 'list')]
    [string]$Action
)

function Generate-Secret {
    $bytes = New-Object Byte[] 32
    $rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::new()
    $rng.GetBytes($bytes)
    return [Convert]::ToBase64String($bytes)
}

switch ($Action) {
    'generate' {
        Write-Host "=== Generating New Secrets ==="
        $secrets = @{
            'STRAPI_JWT_SECRET' = Generate-Secret
            'STRAPI_ADMIN_JWT_SECRET' = Generate-Secret
            'STRAPI_APP_KEYS' = "$(Generate-Secret),$(Generate-Secret)"
            'STRAPI_API_TOKEN_SALT' = Generate-Secret
            'STRAPI_TRANSFER_TOKEN_SALT' = Generate-Secret
            'POSTGRES_PASSWORD' = Generate-Secret
        }

        foreach ($key in $secrets.Keys) {
            Write-Host "`n$key="
            Write-Host $secrets[$key]
            
            $confirmation = Read-Host "Set this secret in GitHub? (y/n)"
            if ($confirmation -eq 'y') {
                gh secret set $key -b$secrets[$key]
                Write-Host "Secret $key has been set in GitHub"
            }
        }
    }
    'set' {
        Write-Host "=== Set Individual Secret ==="
        $key = Read-Host "Enter secret name"
        $value = Read-Host "Enter secret value" -AsSecureString
        $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($value)
        $plainValue = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
        
        gh secret set $key -b$plainValue
        Write-Host "Secret $key has been set in GitHub"
    }
    'list' {
        Write-Host "=== Current GitHub Secrets ==="
        gh secret list
    }
} 