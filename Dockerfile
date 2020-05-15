FROM archlinux/base

# Install virt-manager openssh ask-pass and a terminal
RUN pacman --noconfirm -Sy virt-manager openssh x11-ssh-askpass gnome-terminal

RUN pacman --noconfirm -Syyu

# To allow the creation of windows
RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Default value for the display
ENV DISPLAY=host.docker.internal:0

# To prevent warning from GTK
ENV NO_AT_BRIDGE=1

ENTRYPOINT ["bash"]

# Open virt-manager and a terminal then read for logs
CMD ["-c", "virt-manager && eval `dbus-launch --auto-syntax` gnome-terminal && tail -f /var/log/*.log"]
