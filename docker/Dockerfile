FROM kalilinux/kali-rolling 

# Metadata
LABEL maintainer="516 Hackers Toolkit"
LABEL description="Cybertoolkit - Ethical Security Testing Environment"

# Install base tools
RUN apt update && apt upgrade -y

# Install essential tools
RUN apt install -y \
    whois \
    nmap \
    nikto \
    gobuster \
    dirb \
    python3 \
    python3-pip \
    git \
    curl

# Install Python tools
RUN pip3 install \
    theharvester \
    pdfplumber \
    Pillow \
    requests

# Create workspace
WORKDIR /workspace
VOLUME ["/workspace"]

# Copy toolkit
COPY . /opt/cybertoolkit
WORKDIR /opt/cybertoolkit

# Make scripts executable
RUN find tools -name "*.sh" -exec chmod +x {} \;
RUN find tools -name "*.py" -exec chmod +x {} \;

# Default command
CMD ["/bin/bash"]
