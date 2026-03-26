# Se baser sur une version stable et légère de debian
FROM debian:trixie-slim

# Installer tous les paquets nécéssaires pour la cross-compilation
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    qemu-user \
    gdb-multiarch \
    make \
# Enlever les fichiers d'installation qui ne serveront pas.
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*\
# Supprimer tous les émulateurs QEMU sauf celui d'aarch64.
    && mv /usr/bin/qemu-aarch64 /tmp/qemu-save \
    && rm /usr/bin/qemu-* \
    && mv /tmp/qemu-save /usr/bin/qemu-aarch64 \
# Les alias pour lier les outils de cross-compilation aux noms natifs (dans les make files du prof).
    && ln -s /usr/bin/aarch64-linux-gnu-as /usr/bin/as \
    && ln -s /usr/bin/aarch64-linux-gnu-ld /usr/bin/ld \
    && ln -s /usr/bin/aarch64-linux-gnu-gcc /usr/bin/gcc \
    && ln -s /usr/bin/aarch64-linux-gnu-g++ /usr/bin/g++

# Copier le dossier .devcontainer/tools dans le container sous /root/.../tools
COPY ./tools /root/SOURCES/ift209/tools

# Paramètres du serveur de débogage
ENV DB_HOST=localhost \
    DB_PORT=1234

# Copier le contenu de extra.bashrc dans le bashrc
COPY ./extra.bashrc /extra.bashrc
RUN cat /extra.bashrc >> ~/.bashrc && rm /extra.bashrc