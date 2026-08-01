# Cron Job Scheduler and Manager

A menu-driven Bash script for managing Linux cron jobs from the terminal. This project provides an easy interface to add, view, search, delete, back up, restore, and remove cron jobs.

## Features

- Add new cron jobs
- View existing cron jobs
- Delete cron jobs by line number
- Search cron jobs using keywords
- Backup cron jobs
- Restore cron jobs from backup
- Remove all cron jobs
- Simple menu-driven terminal interface

## Requirements

- Linux operating system
- Bash shell
- `cron` service installed and running

## Installation

Clone the repository:

```bash
git clone https://github.com/swapnil-kumar06/cron-job-scheduler.git
cd cron-job-scheduler
```

Make the script executable:

```bash
chmod +x cron_manager.sh
```

Run the script:

```bash
./cron_manager.sh
```

## Project Structure

```
cron-job-scheduler/
├── cron_manager.sh
├── backup/
│   └── cron_backup.txt (created automatically)
└── README.md
```

## Author

**Swapnil Kumar**

## License

This project is intended for educational and learning purposes.
