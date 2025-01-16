# start-all-docker-containers.sh
This script is to start all docker containers on startup of this linux machine.

## What is this?
This is a script to automatically start all docker containers you have on the current machine. (As [service](#run-as-service) or as [global command](#run-as-global-command))

## How to use this?
You can use this script 2 different ways. As a [service](#run-as-service) or as a [global command](#run-as-global-command).

For both you need to get the code on your machine. A simple way to do this is by cloning this repo. You can do this by running `git clone git@github.com:HowlingArcher/start-all-docker-containers.git`

Then you can CD into the folder with `cd start-all-docker-containers.sh`.

### Run as service
To run this as a service so that the script runs at the startup of the machine you need to make a service file. You can do this by:
```sudo nano /etc/systemd/system/start-all-containers.service```

and paste something like this in there:
```[Unit]
Description=My Custom Script
After=network.target

[Service]
ExecStart=/bin/bash /executables/start-all-containers.sh
Restart=on-failure
User=<your_user>
Group=<your_group>

[Install]
WantedBy=multi-user.target
```

Enter the username in <your_user> to run the script at startup as that user.
Same goes for the <your_group> placeholder.


You also need to make it an executable.
You can do this by running this command:
```sudo chmod +x start-all-containers.sh```

To make the service work and actually run at startup run this:
```sudo systemctl enable start-all-containers.service```

To check the status of the service you can run:
```sudo systemctl status start-all-containers.service```

To start it now as well you can run this command:
```sudo systemctl start start-all-containers.service```

### Run as global command
To run it as a command you have to make the file an executable:
```sudo chmod +x start-all-containers.sh```

Now you can copy it over to your /usr/local/bin folder like so:
```sudo cp ./start-all-containers.sh /usr/local/bin/start-all-containers```

and now you can use the command `start-all-containers` globally in your system!

## How does it work?
The code is faily simple. It uses the `docker ps -aq` command and runs it through a for loop to run `docker start {containerID}`

