# update_allowed_hosts.py

import socket
import os

# Get the host IP address
host_ip = socket.gethostbyname(socket.gethostname())

# Update the ALLOWED_HOSTS setting in settings.py
with open('todoApp/settings.py', 'r') as f:
    lines = f.readlines()

with open('todoApp/settings.py', 'w') as f:
    for line in lines:
        if 'ALLOWED_HOSTS' in line:
            line = f"ALLOWED_HOSTS = ['*', '{host_ip}']\n"
        f.write(line)

