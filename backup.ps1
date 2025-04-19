# Tạo thư mục backup nếu chưa tồn tại
if (-not (Test-Path -Path "backup")) {
    New-Item -ItemType Directory -Path "backup"
}

# Backup database PostgreSQL
Write-Host "Backing up PostgreSQL database..."
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
docker exec rate-postgres pg_dump -U joy -d rate > "backup/rate_$timestamp.sql"

# Backup uploads từ Strapi
Write-Host "Backing up Strapi uploads..."
docker exec rate-strapi tar -czf - /opt/app/public/uploads > "backup/uploads_$timestamp.tar.gz"

# Backup full Strapi sử dụng export
Write-Host "Backing up full Strapi data..."
docker exec rate-strapi bash -c "cd /opt/app && yarn strapi export --no-encrypt --file strapi-export-$timestamp"
docker cp "rate-strapi:/opt/app/strapi-export-$timestamp.tar.gz" "./backup/"

Write-Host "Backup completed successfully!"
Write-Host "Files created:"
Write-Host "- backup/rate_$timestamp.sql (Database dump)"
Write-Host "- backup/uploads_$timestamp.tar.gz (Media files)"
Write-Host "- backup/strapi-export-$timestamp.tar.gz (Strapi export)" 