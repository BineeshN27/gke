# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "google_sql_database_instance" "cloudsql_mysql" {
  database_version = "MYSQL_8_0_31"
  instance_type    = "CLOUD_SQL_INSTANCE"
  name             = "cloud-mysql"
  region           = "us-central1"
  root_password    = "password" # sensitive
  settings {
    availability_type           = "ZONAL"
    deletion_protection_enabled = false
    disk_autoresize             = true
    disk_autoresize_limit       = 0
    disk_size                   = 10
    disk_type                   = "PD_HDD"
    edition                     = "ENTERPRISE"
    tier                        = "db-f1-micro"
    user_labels                 = {}
    # backup_configuration {
    #   binary_log_enabled             = false
    #   enabled                        = false
    #   location                       = null
    #   point_in_time_recovery_enabled = false
    #   start_time                     = "12:00"
    #   transaction_log_retention_days = 7
    #   backup_retention_settings {
    #     retained_backups = 7
    #     retention_unit   = "COUNT"
    #   }
    # }
    # insights_config {
    #   query_insights_enabled  = false
    #   query_plans_per_minute  = 0
    #   query_string_length     = 1024
    #   record_application_tags = false
    #   record_client_address   = false
    # }
    ip_configuration {
      enable_private_path_for_google_cloud_services = false
      ipv4_enabled                                  = true
      authorized_networks {
        name  = "access"
        value = "0.0.0.0/0"
      }
    }
    location_preference {
      follow_gae_application = null
      secondary_zone         = null
      zone                   = "us-central1-a"
    }
    maintenance_window {
      day          = 1
      hour         = 0
      update_track = "canary"
    }


  }
}
