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

   - For example, if your user is `postgres`, db is `ratebox`, and container is `rateDB`:

   ```powershell
   $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
   docker exec rateDB pg_dump -U postgres ratebox > "backup_$timestamp.sql"
   ```

4. **Check the backup file**
   - The file `backup_<timestamp>.sql` will be created in your current directory.

## Notes

- Always keep your `.env` file secure. Do not share sensitive credentials.
- For automated backups, consider scripting and scheduling this command.

---

**See also:** [Restoring a PostgreSQL Backup](./restore-postgres.md) (if available)
