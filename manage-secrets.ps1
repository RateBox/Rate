param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('set', 'generate', 'list', 'update-from-env')]
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
                gh secret set "$key" --body "$($secrets[$key])"
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
        
        gh secret set "$key" --body "$plainValue"
        Write-Host "Secret $key has been set in GitHub"
    }
    'list' {
        Write-Host "=== Current GitHub Secrets ==="
        gh secret list
    }
    'update-from-env' {
        Write-Host "=== Updating GitHub Secrets from .env files ==="
        
        # Get secrets from Strapi .env
        if (Test-Path "strapi/.env") {
            $strapiEnv = Get-Content "strapi/.env" | Where-Object { $_ -match "=" }
            foreach ($line in $strapiEnv) {
                if ($line.StartsWith("#")) { continue }
                $parts = $line -split "=", 2
                if ($parts.Count -eq 2) {
                    $key = $parts[0].Trim()
                    $value = $parts[1].Trim()
                    # Remove quotes if present
                    $value = $value -replace '^["''](.*)["'']$', '$1'
                    
                    # Only set certain sensitive keys
                    $sensitiveKeys = @(
                        "APP_KEYS", "API_TOKEN_SALT", "ADMIN_JWT_SECRET", 
                        "TRANSFER_TOKEN_SALT", "JWT_SECRET", "PREVIEW_SECRET",
                        "DATABASE_PASSWORD", "POSTGRES_PASSWORD"
                    )
                    
                    $shouldUpdate = $false
                    foreach ($sKey in $sensitiveKeys) {
                        if ($key -eq $sKey) {
                            $shouldUpdate = $true
                            break
                        }
                    }
                    
                    if ($shouldUpdate) {
                        Write-Host "Updating $key from strapi/.env"
                        gh secret set "$key" --body "$value"
                        Write-Host "Secret $key has been set in GitHub"
                    }
                }
            }
        } else {
            Write-Host "strapi/.env not found"
        }
        
        # Get secrets from PostgreSQL .env
        if (Test-Path "postgres/.env") {
            $pgEnv = Get-Content "postgres/.env" | Where-Object { $_ -match "=" }
            foreach ($line in $pgEnv) {
                if ($line.StartsWith("#")) { continue }
                $parts = $line -split "=", 2
                if ($parts.Count -eq 2) {
                    $key = $parts[0].Trim()
                    $value = $parts[1].Trim()
                    # Remove quotes if present
                    $value = $value -replace '^["''](.*)["'']$', '$1'
                    
                    # Only set certain sensitive keys
                    $sensitiveKeys = @("POSTGRES_PASSWORD")
                    
                    $shouldUpdate = $false
                    foreach ($sKey in $sensitiveKeys) {
                        if ($key -eq $sKey) {
                            $shouldUpdate = $true
                            break
                        }
                    }
                    
                    if ($shouldUpdate) {
                        Write-Host "Updating $key from postgres/.env"
                        gh secret set "$key" --body "$value"
                        Write-Host "Secret $key has been set in GitHub"
                    }
                }
            }
        } else {
            Write-Host "postgres/.env not found"
        }
        
        # Get secrets from Next.js .env
        if (Test-Path "next/.env") {
            $nextEnv = Get-Content "next/.env" | Where-Object { $_ -match "=" }
            foreach ($line in $nextEnv) {
                if ($line.StartsWith("#")) { continue }
                $parts = $line -split "=", 2
                if ($parts.Count -eq 2) {
                    $key = $parts[0].Trim()
                    $value = $parts[1].Trim()
                    # Remove quotes if present
                    $value = $value -replace '^["''](.*)["'']$', '$1'
                    
                    # Only set certain sensitive keys
                    $sensitiveKeys = @("PREVIEW_SECRET")
                    
                    $shouldUpdate = $false
                    foreach ($sKey in $sensitiveKeys) {
                        if ($key -eq $sKey) {
                            $shouldUpdate = $true
                            break
                        }
                    }
                    
                    if ($shouldUpdate) {
                        Write-Host "Updating $key from next/.env"
                        gh secret set "$key" --body "$value"
                        Write-Host "Secret $key has been set in GitHub"
                    }
                }
            }
        } else {
            Write-Host "next/.env not found"
        }
        
        Write-Host "=== All secrets have been updated ==="
        gh secret list
    }
} 