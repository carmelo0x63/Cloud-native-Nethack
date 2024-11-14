# Start with the Alpine Linux base image
FROM alpine:latest

# Install necessary packages: OpenSSH, Nethack, and other essentials
RUN apk update && \
    apk add --no-cache openssh-server nethack

# Create a user 'nethack' with no password and restricted shell access
RUN adduser -D -s /usr/bin/nethack nethack

# Set a password for the 'nethack' user
RUN echo "nethack:nethack" | chpasswd

# Generate SSH host keys
RUN ssh-keygen -A

# Configure SSH and immediately run nethack when nethack user connects
RUN mkdir -p /var/run/sshd && \
    echo 'AllowUsers nethack' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config && \
    echo 'Match User nethack' >> /etc/ssh/sshd_config && \
    echo '       ForceCommand /usr/bin/nethack' >> /etc/ssh/sshd_config

# Expose port 49222 for SSH
EXPOSE 49222

# Start SSH as a Daemon
CMD ["/usr/sbin/sshd", "-D"]
