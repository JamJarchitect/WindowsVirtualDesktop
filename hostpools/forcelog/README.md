# Force log off users in WVD Host Pool

A simple yet powerful script which allows WVD Admins to force log off ALL users in a host pool in an automated manner.

# Process

This script will:
- Ask for the name of the Host Pool
- Ask for the name of the Resource Group where the Host Pool resides in
- Get all of the sessions in that Host Pool across all Session Hosts
- Log off the users in a verbose manner whilst performing the action