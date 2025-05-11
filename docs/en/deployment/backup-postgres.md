# PostgreSQL Backup in Docker

This guide explains how to back up a PostgreSQL database running inside a Docker container. The steps below ensure your data is safely exported for backup or migration purposes.

## Prerequisites

- Docker is installed and running
- You have access to the terminal/PowerShell
- You know your database service name (e.g., `rateDB`)
- You have the database username and password (see your `.env` file)

## Step-by-step Instructions

1. **Open your terminal or PowerShell**

2. **Find your database service name**

   - Run: `docker ps`
   - Look for the service running PostgreSQL (e.g., `rateDB`)

3. **Export the database with a timestamped filename**

   - Replace `<db_user>`, `<db_name>`, and `<container_name>` as needed.
   - Example command (PowerShell):

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec <container_name> pg_dump -U <db_user> <db_name> > "backup_$timestamp.sql"
   ```

   - For example, with the current configuration (user is `joy`, db is `rate`, and container is `rateDB`):

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec rateDB pg_dump -U joy -d rate > "backup/rate_$timestamp.sql"
   ```

4. **Check the backup file**
   - The file `backup/rate_<timestamp>.sql` will be created in your backup directory.

## Backing up Strapi uploads

In addition to the database, you should also back up the Strapi uploads directory which contains all media files:

```powershell
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Compress-Archive -Path "D:\Projects\RateBox\strapi\public\uploads" -DestinationPath "D:\Projects\RateBox\backup\strapi_uploads_$timestamp.zip" -Force
```

## Complete backup script

Here's a simple PowerShell script to back up both the database and uploads:

```powershell
# Create backup directory if it doesn't exist
if (-not (Test-Path -Path "D:\Projects\RateBox\backup")) {
    New-Item -ItemType Directory -Path "D:\Projects\RateBox\backup"
}

# Backup PostgreSQL database
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Write-Host "Backing up PostgreSQL database..."
docker exec rateDB pg_dump -U joy -d rate > "D:\Projects\RateBox\backup\rate_$timestamp.sql"

# Backup Strapi uploads directory
Write-Host "Backing up Strapi uploads folder..."
Compress-Archive -Path "D:\Projects\RateBox\strapi\public\uploads" -DestinationPath "D:\Projects\RateBox\backup\strapi_uploads_$timestamp.zip" -Force

Write-Host "Backup completed successfully!"
Write-Host "Files created:"
Write-Host "- backup/rate_$timestamp.sql (Database dump)"
Write-Host "- backup/strapi_uploads_$timestamp.zip (Media files)"
```

## Notes

- Always keep your `.env` file secure. Do not share sensitive credentials.
- For automated backups, consider scripting and scheduling this command.
- This document reflects the current development environment where Strapi runs directly on the host machine and only PostgreSQL runs in Docker.

---

**See also:** [Restoring a PostgreSQL Backup](./restore-postgres.md) (if available)
