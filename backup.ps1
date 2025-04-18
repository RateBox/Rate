# Tạo thư mục backup nếu chưa tồn tại
if (-not (Test-Path -Path "backup")) {
    New-Item -ItemType Directory -Path "backup"
}

# Tạo timestamp cho tên file
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

# Backup PostgreSQL database
Write-Host "Backing up PostgreSQL database..."
docker exec rate-postgres pg_dump -U joy -d rate > "backup/rate_$timestamp.sql"

# Backup Strapi uploads
Write-Host "Backing up Strapi uploads..."
if (Test-Path -Path "backup/uploads") {
    Remove-Item -Recurse -Force "backup/uploads"
}
docker cp rate-strapi:/opt/app/public/uploads ./backup/uploads

# Export Strapi data
Write-Host "Exporting Strapi data..."
docker exec rate-strapi bash -c "cd /opt/app && yarn strapi export --no-encrypt --file strapi-export-$timestamp"
docker cp "rate-strapi:/opt/app/strapi-export-$timestamp.tar.gz" "./backup/"

Write-Host "Backup completed!"
Write-Host "Files created:"
Write-Host "- backup/rate_$timestamp.sql (Database dump)"
Write-Host "- backup/uploads/ (Media files)"
Write-Host "- backup/strapi-export-$timestamp.tar.gz (Strapi export)" 