---
layout: post
title: Doing Things Right · Part 1 · Initial Setup
permalink: /:title.html
---

This will be a series of texts explaining to a future me (and anyone that might find it useful) the decisions behind my attempt to have an organized and thought out electronic presence.

I find this necessary because:

1. Methodically logging what I am doing will force me to be less impulsive about changing things just for novelty's sake;
2. I'll have one place to go if I need to reconfigure something or check if I missed some detail;
3. A good exercise in discipline;

These texts will be updated if I come up with new information.

A remote server seems currently needed to host this website, my email, my git repositories and everything else that may need to be backed up remotely or be executed constantly. I'll begin by covering the setup of this server.

The Server
===

Any VPS will do. Don't go with a really cheap one because they tend to disappear. [RamNode](https://ramnode.com/) is the current choice.

For the distribution, Debian stretch/testing is the current choice. Jessie/stable is too old and stretch seems stable enough.

After getting everything online, this is what I did:

    ssh root@<IP>

Make sure I have an updated system

    apt-get update
    apt-get upgrade
    apt-get dist-upgrade

Install a few utilities that I'm sure I'l need

    apt-get install vim curl tmux git zsh

Create my main user to stop using root

    adduser caio
    usermod -a caio -G sudo

Setup my SSH key

    su caio
    mkdir .ssh
    vim .ssh/authorized_keys

Disconnect and check if it works

    ssh caio@<IP>

That MOTD will get boring quickly, also tests if sudo is working

    sudo vim /etc/motd

Disable root login and password login

    sudo vim /etc/ssh/ssh_config
        PermitRootLogin no
        ChallengeResponseAuthentication no
        PasswordAuthentication no
        UsePAM no
    sudo systemctl restart sshd

Now NTP and the timezone

    sudo dpkg-reconfigure tzdata
    sudo apt-get install ntp
    sudo systemctl enable ntp
    sudo systemctl start ntp

And the locale

    sudo dpkg-reconfigure locales

That's it. You now have a working and relatively secure server. Next it'll be getting my [dotfiles](https://git.caioalonso.com/dotphiles/) in place.
