# nell-workstation

## What is this?

This is a Chef cookbook which sets up a basic workstation for me on a VM.

## Why did you make it?

Anytime I've had horrible wifi (i.e. in a coffee shop or, worse, in a plane) getting development work done has crawled to a halt.

I've found it's far more effective to set up a VM as my workstation with a cloud provider (this can be AWS, Digital Ocean, whatever your prefer).  I created this to automate the vim, tmux, terraform, and chef dk setup for a workstation VM.

## What does this do?

The main things this cookbook does is install and/or configure vim, tmux, git, bash, terraform, and chef dk

## How do you use it?

First, create a VM with a cloud provider, then SSH into that VM.

Next, install chef-solo on that VM

```bash
  $ curl -L https://www.chef.io/chef/install.sh | sudo bash
```

Now, make a cookbooks directory on the VM

```bash
  $ sudo mkdir -p /var/chef/cookbooks
```

Pull down this cookbook from Github (doing this rather than git clone since git is not yet installed

```bash
  $ wget -O nell-workstation.tar.gz https://github.com/nellshamrell/nell-workstation/tarball/master
```

Now extract it to the cookbooks directory

```bash
  $ sudo mkdir /var/chef/cookbooks/nell-workstation && sudo tar -xzf nell-workstation.tar.gz -C /var/chef/cookbooks/nell-workstation --strip-components 1
```

Now run chef solo with the cookbook you just downloaded

```bash
  $ sudo chef-solo -o 'recipe[nell-workstation::default]'
```

## Can someone else use this?

Totally!  I would suggest forking this and substituting your own preferred configs for vim, tmux, etc. But feel free to use!

