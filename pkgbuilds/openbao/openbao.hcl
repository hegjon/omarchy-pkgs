# Full configuration options can be found at https://openbao.org/docs/configuration/

ui = true
api_addr      = "http://127.0.0.1:8200"
cluster_addr  = "https://127.0.0.1:8201"

# Not Production Recommended!
# The In-Memory backend is not recommended for production installations
# as data does not persist beyond restarts.
# https://openbao.org/docs/configuration/storage/in-memory/
storage "inmem" {}

# Not Production Recommended!
# The Filesystem storage backend is not recommended for production installations
# as it is not transactional and lacks system-level file locking.
# https://openbao.org/docs/configuration/storage/filesystem/
#storage "file" {
#  path = "/var/lib/openbao"
#}

# Production Ready, supports HA
# The Integrated Storage (Raft) backend is considered production ready
# and supports High Availability, paginated lists and transactional storage.
# https://openbao.org/docs/configuration/storage/raft/
#storage "raft" {
#  path = "/var/lib/openbao"
#  node_id = "raft_node_1"
#}

# Production Ready, supports HA
# The PostgreSQL backend is considered production ready
# and supports High Availability, paginated lists and transactional storage.
# https://openbao.org/docs/configuration/storage/postgresql/
#storage "postgresql" {
#  connection_url = "postgres://user123:secret123!@localhost:5432/openbao"
#}

# HTTP listener
listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
}

# HTTPS listener
#listener "tcp" {
#  address       = "0.0.0.0:8200"
#  tls_cert_file = "/var/lib/openbao/tls.crt"
#  tls_key_file  = "/var/lib/openbao/tls.key"
#}

# See https://archlinux.org/packages/?sort=&q=openbao%2Dplugin
# https://openbao.org/docs/configuration/plugins/
plugin_directory = "/usr/lib/openbao/plugins"
