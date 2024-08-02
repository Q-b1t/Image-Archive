## Install .NET 8 on Kali Linux

Full instructions are available at https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian

### Step # 1

Open a terminal window.

Add the Microsoft package signing key to your list of trusted keys and add the package repository.

```bash
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

### Step # 2

Install the SDK

```bash
sudo apt-get update && sudo apt-get install -y dotnet-sdk-8.0
```

### Step # 3

Install the runtime.  There are actually two types of runtimes available - the first includes ASP.NET, and the second does not.  You can use either one for this course, but the ASP.NET one is a more complete runtime.

Run the following command to install the full runtime (including ASP.NET)

```bash
sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-8.0
```

OR, run this command to install the runtime without ASP.NET support (totally adequate for this course!)

```bash	
sudo apt-get install -y dotnet-runtime-8.0
```


### Troubleshooting

If you run into issues, please refer to the documentation found on the Microsoft .NET website (https://dotnet.microsoft.com/en-us/).  Additional troubleshooting steps and the latest instructions can be found here:  https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian





