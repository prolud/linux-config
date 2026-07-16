sudo apt install openfortivpn

cat > ~/.vpn/openfortivpn/config <<'EOF'
host = 
port = 
username = 
password = 
set-dns = 
pppd-use-peerdns = 
trusted-cert = 
EOF