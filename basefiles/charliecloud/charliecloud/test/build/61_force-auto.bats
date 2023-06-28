# NOTE: This file is auto-generated. Do not modify.

load ../common

setup () {
    [[ $CH_TEST_BUILDER = ch-image ]] || skip 'ch-image only'
    [[ $CH_IMAGE_CACHE = enabled ]] || skip 'bucache enabled only'
}


@test "ch-image --force: almalinux:8, unneeded fail, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: almalinux:8, unneeded fail, None, preprep: not needed

@test "ch-image --force: almalinux:8, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: almalinux:8, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: almalinux:8, unneeded fail, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: almalinux:8, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: almalinux:8, unneeded win, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: almalinux:8, unneeded win, None, preprep: not needed

@test "ch-image --force: almalinux:8, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: almalinux:8, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: almalinux:8, unneeded win, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: almalinux:8, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: almalinux:8, fake needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: almalinux:8, fake needed, None, preprep: not needed

@test "ch-image --force: almalinux:8, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: almalinux:8, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: almalinux:8, fake needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: almalinux:8, fake needed, seccomp, preprep: not needed

@test "ch-image --force: almalinux:8, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: almalinux:8, needed, None, preprep: not needed

@test "ch-image --force: almalinux:8, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: almalinux:8, needed, fakeroot, preprep" {
scope full


# build 1: intermediate image for preparatory commands
run ch-image -v build -t tmpimg -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y epel-release
EOF
echo "$output"
[[ $status -eq 0 ]]


# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM tmpimg
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: almalinux:8, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM almalinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: almalinux:8, needed, seccomp, preprep: no preprep for --force=seccomp

@test "ch-image --force: alpine:3.9, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:3.9, unneeded fail, None, preprep: not needed

@test "ch-image --force: alpine:3.9, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"

}

# skip: alpine:3.9, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: alpine:3.9, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:3.9, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: alpine:3.9, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:3.9, unneeded win, None, preprep: not needed

@test "ch-image --force: alpine:3.9, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"

}

# skip: alpine:3.9, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: alpine:3.9, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:3.9, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: alpine:3.9, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:3.9, fake needed, None, preprep: not needed

@test "ch-image --force: alpine:3.9, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: alpine:3.9, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: alpine:3.9, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:3.9, fake needed, seccomp, preprep: not needed

@test "ch-image --force: alpine:3.9, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:3.9, needed, None, preprep: not needed

@test "ch-image --force: alpine:3.9, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: alpine:3.9, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: alpine:3.9, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:3.9
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:3.9, needed, seccomp, preprep: no preprep command

@test "ch-image --force: alpine:latest, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:latest, unneeded fail, None, preprep: not needed

@test "ch-image --force: alpine:latest, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"

}

# skip: alpine:latest, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: alpine:latest, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:latest, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: alpine:latest, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:latest, unneeded win, None, preprep: not needed

@test "ch-image --force: alpine:latest, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"

}

# skip: alpine:latest, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: alpine:latest, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:latest, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: alpine:latest, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:latest, fake needed, None, preprep: not needed

@test "ch-image --force: alpine:latest, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: alpine:latest, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: alpine:latest, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:latest, fake needed, seccomp, preprep: not needed

@test "ch-image --force: alpine:latest, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: alpine:latest, needed, None, preprep: not needed

@test "ch-image --force: alpine:latest, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: alpine"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: alpine:latest, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: alpine:latest, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM alpine:latest
RUN apk add dbus
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: alpine:latest, needed, seccomp, preprep: no preprep command

@test "ch-image --force: archlinux:latest, unneeded fail, None, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: archlinux:latest, unneeded fail, None, preprep: not needed

@test "ch-image --force: archlinux:latest, unneeded fail, fakeroot, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: arch"

}

# skip: archlinux:latest, unneeded fail, fakeroot, preprep: not needed

# skip: archlinux:latest, unneeded fail, seccomp, no preprep: --force=seccomp excluded

# skip: archlinux:latest, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: archlinux:latest, unneeded win, None, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: archlinux:latest, unneeded win, None, preprep: not needed

@test "ch-image --force: archlinux:latest, unneeded win, fakeroot, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: arch"

}

# skip: archlinux:latest, unneeded win, fakeroot, preprep: not needed

# skip: archlinux:latest, unneeded win, seccomp, no preprep: --force=seccomp excluded

# skip: archlinux:latest, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: archlinux:latest, fake needed, None, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN pacman -Syq --noconfirm ed; ! fgrep failed: /var/log/pacman.log
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: archlinux:latest, fake needed, None, preprep: not needed

@test "ch-image --force: archlinux:latest, fake needed, fakeroot, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN pacman -Syq --noconfirm ed; ! fgrep failed: /var/log/pacman.log
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: arch"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: archlinux:latest, fake needed, fakeroot, preprep: not needed

# skip: archlinux:latest, fake needed, seccomp, no preprep: --force=seccomp excluded

# skip: archlinux:latest, fake needed, seccomp, preprep: not needed

@test "ch-image --force: archlinux:latest, needed, None, no preprep" {
scope standard
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN pacman -Syq --noconfirm openssh; ! fgrep failed: /var/log/pacman.log
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: archlinux:latest, needed, None, preprep: not needed

@test "ch-image --force: archlinux:latest, needed, fakeroot, no preprep" {
scope full
arch_exclude aarch64
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM archlinux:latest
RUN pacman -Syq --noconfirm openssh; ! fgrep failed: /var/log/pacman.log
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: arch"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: archlinux:latest, needed, fakeroot, preprep: no preprep command

# skip: archlinux:latest, needed, seccomp, no preprep: --force=seccomp excluded

# skip: archlinux:latest, needed, seccomp, preprep: no preprep command

@test "ch-image --force: centos:7, unneeded fail, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: centos:7, unneeded fail, None, preprep: not needed

@test "ch-image --force: centos:7, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel7"

}

# skip: centos:7, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: centos:7, unneeded fail, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: centos:7, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: centos:7, unneeded win, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: centos:7, unneeded win, None, preprep: not needed

@test "ch-image --force: centos:7, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel7"

}

# skip: centos:7, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: centos:7, unneeded win, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: centos:7, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: centos:7, fake needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: centos:7, fake needed, None, preprep: not needed

@test "ch-image --force: centos:7, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel7"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: centos:7, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: centos:7, fake needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: centos:7, fake needed, seccomp, preprep: not needed

@test "ch-image --force: centos:7, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: centos:7, needed, None, preprep: not needed

@test "ch-image --force: centos:7, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel7"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: centos:7, needed, fakeroot, preprep" {
scope full


# build 1: intermediate image for preparatory commands
run ch-image -v build -t tmpimg -f - . << 'EOF'
FROM centos:7
RUN yum install -y epel-release
EOF
echo "$output"
[[ $status -eq 0 ]]


# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM tmpimg
RUN yum install -y openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel7"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: centos:7, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM centos:7
RUN yum install -y openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: centos:7, needed, seccomp, preprep: no preprep for --force=seccomp

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: quay.io/centos/centos:stream8, unneeded fail, None, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: quay.io/centos/centos:stream8, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: quay.io/centos/centos:stream8, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: quay.io/centos/centos:stream8, unneeded win, None, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: quay.io/centos/centos:stream8, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: quay.io/centos/centos:stream8, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: quay.io/centos/centos:stream8, fake needed, None, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: quay.io/centos/centos:stream8, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: quay.io/centos/centos:stream8, fake needed, seccomp, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: quay.io/centos/centos:stream8, needed, None, preprep: not needed

@test "ch-image --force: quay.io/centos/centos:stream8, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: quay.io/centos/centos:stream8, needed, fakeroot, preprep" {
scope full


# build 1: intermediate image for preparatory commands
run ch-image -v build -t tmpimg -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y epel-release
EOF
echo "$output"
[[ $status -eq 0 ]]


# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM tmpimg
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: quay.io/centos/centos:stream8, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM quay.io/centos/centos:stream8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: quay.io/centos/centos:stream8, needed, seccomp, preprep: no preprep for --force=seccomp

@test "ch-image --force: debian:10, unneeded fail, None, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:10, unneeded fail, None, preprep: not needed

@test "ch-image --force: debian:10, unneeded fail, fakeroot, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: debian:10, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: debian:10, unneeded fail, seccomp, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:10, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: debian:10, unneeded win, None, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:10, unneeded win, None, preprep: not needed

@test "ch-image --force: debian:10, unneeded win, fakeroot, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: debian:10, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: debian:10, unneeded win, seccomp, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:10, unneeded win, seccomp, preprep: not needed

# skip: debian:10, fake needed, None, no preprep: no run command

# skip: debian:10, fake needed, None, preprep: not needed

# skip: debian:10, fake needed, fakeroot, no preprep: no run command

# skip: debian:10, fake needed, fakeroot, preprep: not needed

# skip: debian:10, fake needed, seccomp, no preprep: no run command

# skip: debian:10, fake needed, seccomp, preprep: not needed

@test "ch-image --force: debian:10, needed, None, no preprep" {
scope standard
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:10, needed, None, preprep: not needed

@test "ch-image --force: debian:10, needed, fakeroot, no preprep" {
scope full
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: debian:10, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: debian:10, needed, seccomp, no preprep" {
scope standard
arch_exclude ppc64le

# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:10
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:10, needed, seccomp, preprep: no preprep command

@test "ch-image --force: debian:latest, unneeded fail, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:latest, unneeded fail, None, preprep: not needed

@test "ch-image --force: debian:latest, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: debian:latest, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: debian:latest, unneeded fail, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:latest, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: debian:latest, unneeded win, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:latest, unneeded win, None, preprep: not needed

@test "ch-image --force: debian:latest, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: debian:latest, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: debian:latest, unneeded win, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:latest, unneeded win, seccomp, preprep: not needed

# skip: debian:latest, fake needed, None, no preprep: no run command

# skip: debian:latest, fake needed, None, preprep: not needed

# skip: debian:latest, fake needed, fakeroot, no preprep: no run command

# skip: debian:latest, fake needed, fakeroot, preprep: not needed

# skip: debian:latest, fake needed, seccomp, no preprep: no run command

# skip: debian:latest, fake needed, seccomp, preprep: not needed

@test "ch-image --force: debian:latest, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: debian:latest, needed, None, preprep: not needed

@test "ch-image --force: debian:latest, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: debian:latest, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: debian:latest, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM debian:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: debian:latest, needed, seccomp, preprep: no preprep command

@test "ch-image --force: fedora:26, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:26, unneeded fail, None, preprep: not needed

@test "ch-image --force: fedora:26, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"

}

# skip: fedora:26, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: fedora:26, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:26, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: fedora:26, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:26, unneeded win, None, preprep: not needed

@test "ch-image --force: fedora:26, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"

}

# skip: fedora:26, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: fedora:26, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:26, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: fedora:26, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:26, fake needed, None, preprep: not needed

@test "ch-image --force: fedora:26, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: fedora:26, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: fedora:26, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:26, fake needed, seccomp, preprep: not needed

@test "ch-image --force: fedora:26, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:26, needed, None, preprep: not needed

@test "ch-image --force: fedora:26, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: fedora:26, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: fedora:26, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:26
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:26, needed, seccomp, preprep: no preprep command

@test "ch-image --force: fedora:34, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:34, unneeded fail, None, preprep: not needed

@test "ch-image --force: fedora:34, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"

}

# skip: fedora:34, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: fedora:34, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:34, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: fedora:34, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:34, unneeded win, None, preprep: not needed

@test "ch-image --force: fedora:34, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"

}

# skip: fedora:34, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: fedora:34, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:34, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: fedora:34, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:34, fake needed, None, preprep: not needed

@test "ch-image --force: fedora:34, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: fedora:34, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: fedora:34, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:34, fake needed, seccomp, preprep: not needed

@test "ch-image --force: fedora:34, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: fedora:34, needed, None, preprep: not needed

@test "ch-image --force: fedora:34, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: fedora"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: fedora:34, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: fedora:34, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM fedora:34
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: fedora:34, needed, seccomp, preprep: no preprep command

@test "ch-image --force: opensuse/leap:15.0, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:15.0, unneeded fail, None, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"

}

# skip: opensuse/leap:15.0, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:15.0, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:15.0, unneeded win, None, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"

}

# skip: opensuse/leap:15.0, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:15.0, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:15.0, fake needed, None, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: opensuse/leap:15.0, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:15.0, fake needed, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:15.0, needed, None, preprep: not needed

@test "ch-image --force: opensuse/leap:15.0, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: opensuse/leap:15.0, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: opensuse/leap:15.0, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:15.0
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:15.0, needed, seccomp, preprep: no preprep command

@test "ch-image --force: opensuse/leap:latest, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:latest, unneeded fail, None, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"

}

# skip: opensuse/leap:latest, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:latest, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:latest, unneeded win, None, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"

}

# skip: opensuse/leap:latest, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:latest, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:latest, fake needed, None, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: opensuse/leap:latest, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:latest, fake needed, seccomp, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: opensuse/leap:latest, needed, None, preprep: not needed

@test "ch-image --force: opensuse/leap:latest, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: suse"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: opensuse/leap:latest, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: opensuse/leap:latest, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM opensuse/leap:latest
RUN zypper install -y dbus-1
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: opensuse/leap:latest, needed, seccomp, preprep: no preprep command

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded fail, None, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded win, None, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, fake needed, None, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: registry.access.redhat.com/ubi8/ubi, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, fake needed, seccomp, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, needed, None, preprep: not needed

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: registry.access.redhat.com/ubi8/ubi, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: registry.access.redhat.com/ubi8/ubi, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM registry.access.redhat.com/ubi8/ubi
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: registry.access.redhat.com/ubi8/ubi, needed, seccomp, preprep: no preprep command

@test "ch-image --force: rockylinux:8, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: rockylinux:8, unneeded fail, None, preprep: not needed

@test "ch-image --force: rockylinux:8, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: rockylinux:8, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: rockylinux:8, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: rockylinux:8, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: rockylinux:8, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: rockylinux:8, unneeded win, None, preprep: not needed

@test "ch-image --force: rockylinux:8, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"

}

# skip: rockylinux:8, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: rockylinux:8, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: rockylinux:8, unneeded win, seccomp, preprep: not needed

@test "ch-image --force: rockylinux:8, fake needed, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: rockylinux:8, fake needed, None, preprep: not needed

@test "ch-image --force: rockylinux:8, fake needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: rockylinux:8, fake needed, fakeroot, preprep: not needed

@test "ch-image --force: rockylinux:8, fake needed, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false ed
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: rockylinux:8, fake needed, seccomp, preprep: not needed

@test "ch-image --force: rockylinux:8, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: rockylinux:8, needed, None, preprep: not needed

@test "ch-image --force: rockylinux:8, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: rockylinux:8, needed, fakeroot, preprep" {
scope full


# build 1: intermediate image for preparatory commands
run ch-image -v build -t tmpimg -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y epel-release
EOF
echo "$output"
[[ $status -eq 0 ]]


# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM tmpimg
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: rhel8"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

@test "ch-image --force: rockylinux:8, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM rockylinux:8
RUN dnf install -y --setopt=install_weak_deps=false openssh
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: rockylinux:8, needed, seccomp, preprep: no preprep for --force=seccomp

@test "ch-image --force: ubuntu:16.04, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:16.04, unneeded fail, None, preprep: not needed

@test "ch-image --force: ubuntu:16.04, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: ubuntu:16.04, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: ubuntu:16.04, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:16.04, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: ubuntu:16.04, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:16.04, unneeded win, None, preprep: not needed

@test "ch-image --force: ubuntu:16.04, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: ubuntu:16.04, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: ubuntu:16.04, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:16.04, unneeded win, seccomp, preprep: not needed

# skip: ubuntu:16.04, fake needed, None, no preprep: no run command

# skip: ubuntu:16.04, fake needed, None, preprep: not needed

# skip: ubuntu:16.04, fake needed, fakeroot, no preprep: no run command

# skip: ubuntu:16.04, fake needed, fakeroot, preprep: not needed

# skip: ubuntu:16.04, fake needed, seccomp, no preprep: no run command

# skip: ubuntu:16.04, fake needed, seccomp, preprep: not needed

@test "ch-image --force: ubuntu:16.04, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:16.04, needed, None, preprep: not needed

@test "ch-image --force: ubuntu:16.04, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: ubuntu:16.04, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: ubuntu:16.04, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:16.04
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:16.04, needed, seccomp, preprep: no preprep command

@test "ch-image --force: ubuntu:latest, unneeded fail, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:latest, unneeded fail, None, preprep: not needed

@test "ch-image --force: ubuntu:latest, unneeded fail, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: ubuntu:latest, unneeded fail, fakeroot, preprep: not needed

@test "ch-image --force: ubuntu:latest, unneeded fail, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN false
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:latest, unneeded fail, seccomp, preprep: not needed

@test "ch-image --force: ubuntu:latest, unneeded win, None, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:latest, unneeded win, None, preprep: not needed

@test "ch-image --force: ubuntu:latest, unneeded win, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"

}

# skip: ubuntu:latest, unneeded win, fakeroot, preprep: not needed

@test "ch-image --force: ubuntu:latest, unneeded win, seccomp, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN true
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:latest, unneeded win, seccomp, preprep: not needed

# skip: ubuntu:latest, fake needed, None, no preprep: no run command

# skip: ubuntu:latest, fake needed, None, preprep: not needed

# skip: ubuntu:latest, fake needed, fakeroot, no preprep: no run command

# skip: ubuntu:latest, fake needed, fakeroot, preprep: not needed

# skip: ubuntu:latest, fake needed, seccomp, no preprep: no run command

# skip: ubuntu:latest, fake needed, seccomp, preprep: not needed

@test "ch-image --force: ubuntu:latest, needed, None, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build  -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 1 ]]


}

# skip: ubuntu:latest, needed, None, preprep: not needed

@test "ch-image --force: ubuntu:latest, needed, fakeroot, no preprep" {
scope full


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=fakeroot -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]
echo "$output" | grep -Eq -- "--force=fakeroot: will use: debderiv"
echo "$output" | grep -Eq -- "--force=fakeroot: modified 1 RUN instructions"

}

# skip: ubuntu:latest, needed, fakeroot, preprep: no preprep command

@test "ch-image --force: ubuntu:latest, needed, seccomp, no preprep" {
scope standard


# build 1: intermediate image for preparatory commands
# skipped: no separate prep

# build 2: image we're testing
run ch-image -v build --force=seccomp -t tmpimg2 -f - . << 'EOF'
FROM ubuntu:latest
RUN     apt-get update && apt-get install -y openssh-client
EOF
echo "$output"
[[ $status -eq 0 ]]


}

# skip: ubuntu:latest, needed, seccomp, preprep: no preprep command
