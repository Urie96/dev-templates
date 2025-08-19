nixpkgs_target_commit := "fd487183437963a59ba763c0cc4f27e3447dd6dd"
rust_overlay_target_commit := "10d4529b7ead35863caa77993915104345524bed"

# curl https://api.github.com/repos/NixOS/nixpkgs/commits/nixos-25.05 | grep -m 1 '"sha":' | cut -d '"' -f 4
# curl https://api.github.com/repos/oxalica/rust-overlay/commits/stable | grep -m 1 '"sha":' | cut -d '"' -f 4

update:
    #!/usr/bin/env bash
    find . -type f -name "shell.nix" | while read -r file; do
        sed -i.bak -E \
            -e "s|https://github.com/NixOS/nixpkgs/archive/[a-f0-9]+\.tar\.gz|https://github.com/NixOS/nixpkgs/archive/{{ nixpkgs_target_commit }}.tar.gz|g" \
            -e "s|https://github.com/oxalica/rust-overlay/archive/[a-f0-9]+\.tar\.gz|https://github.com/oxalica/rust-overlay/archive/{{ rust_overlay_target_commit }}.tar.gz|g" \
            "$file"

        # 检查是否有变化
        if ! diff -q "$file" "$file.bak" > /dev/null; then
            echo "已更新文件: $file"
            rm "$file.bak"  # 删除备份文件
        else
            echo "未发现需要替换的内容: $file"
            rm "$file.bak"  # 删除无用的备份文件
        fi
    done
