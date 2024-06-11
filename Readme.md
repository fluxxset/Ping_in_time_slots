
# Ping IPs Script

This Bash script pings a list of IP addresses at regular intervals and logs the response times. The interval and total duration for the script to run are specified as arguments.

## Prerequisites

- Bash shell
- `ping` command available on the system

## Getting Started

### 1. Clone the Repository

Clone the repository to your local machine:

```sh
git clone https://github.com/fluxxset/Ping_in_time_slots.git
cd Ping_in_time_slots
```

### 2. Prepare the IP List

Create a file named `ip_list.txt` in the same directory as the script. Add one IP address per line. For example:

```
192.168.1.1
8.8.8.8
8.8.4.4
```

### 3. Make the Script Executable

Run the following command to make the script executable:

```sh
chmod +x ping_ips.sh
```

### 4. Run the Script

Run the script with the interval and total duration in minutes as arguments. For example, to ping every 10 minutes for a total duration of 2 hours (120 minutes):

```sh
nohup ./ping_ips.sh 10 120 &
```

The `nohup` command allows the script to run in the background even after the terminal is closed. The `&` at the end runs the script as a background process.

### 5. Check the Logs

The script logs the ping results in a file named `ping_log.txt` in the same directory. Each entry includes the date, IP address, and response time. For example:

```
Mon Jun 14 10:00:00 UTC 2024 - 192.168.1.1 - 1.23 ms
Mon Jun 14 10:00:00 UTC 2024 - 8.8.8.8 - 10.45 ms
Mon Jun 14 10:00:00 UTC 2024 - 8.8.4.4 - 15.67 ms
```

### Notes

- Ensure the `ip_list.txt` file is in the same directory as `ping_ips.sh`.
- Adjust the interval and duration values as needed.
- The script will stop running automatically after the specified duration.
