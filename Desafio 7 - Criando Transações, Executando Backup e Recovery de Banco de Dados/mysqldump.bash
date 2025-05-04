# Backup completo com procedures e eventos
mysqldump -u root -p --routines --events --databases ecommerce universidade > backup_geral.sql

# Recuperação do banco a partir do backup
mysql -u root -p < backup_geral.sql