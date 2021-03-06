if [ -x "/usr/bin/pacman" ] && [ ! -e /tmp/okay-pacman-notify ]; then
    current_version=$(uname -r | cut -d- -f1)
    package_version=$(pacman -Q linux | cut -d' ' -f2 | cut -d- -f1 | cut -d. -f-3)
    if [ "$current_version" != "$package_version" ]; then
        echo -e "${fg_bold[red]}Your kernel needs to be updated ($current_version -> $package_version). Reboot the system at the next earliest convenience."
    fi
fi
