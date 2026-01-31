if ("dist" | path exists) and ("dist" | path type) != "dir" {
    rm "dist"
}

if not ("dist" | path exists) {
    mkdir "dist"
}

if not ("dist/data" | path exists) {
    mkdir "dist/data"
}

# Load rime-fast-xhup module
cp -r ./submodules/rime-fast-xhup/cn_dicts ./dist/
cp -r ./submodules/rime-flyhe-dict/* ./dist/cn_dicts/ext/
cp -r ./submodules/rime-fast-xhup/en_dicts ./dist/
cp -r ./submodules/rime-fast-xhup/lua ./dist/
cp -r ./submodules/rime-fast-xhup/opencc ./dist/
cp -r ./submodules/rime-fast-xhup/others ./dist/

cp ./submodules/rime-fast-xhup/flyhe_fast.* ./dist/
cp ./submodules/rime-fast-xhup/easy_en.* ./dist/
cp ./submodules/rime-fast-xhup/flypy_* ./dist/
cp ./submodules/rime-fast-xhup/melt_eng* ./dist/

cp ./submodules/rime-fast-xhup/predict.db ./dist/
# cp ./submodules/rime-fast-xhup/custom_phrase.txt ./dist/
cp ./submodules/rime-fast-xhup/idiom_phrase.txt ./dist/
cp ./submodules/rime-fast-xhup/zh-hans-t-essay-bgw.gram ./dist/

# Clean the files I don't want
rm ./dist/flyhe_fast.custom.yaml
rm ./dist/flypy_xhfast.custom.yaml

# Load my own scripts
cp -r ./src/* ./dist/

open ./src/custom_phrase.txt | lines | each { |line|
    if ($line | str starts-with "#") or ($line | is-empty) {
        $line
    } else {
        $line | str replace --all --regex '\s+' "\t"
    }
} | save --force ./dist/custom_phrase.txt

cp ./src/flyhe_fast.custom.yaml ./dist/flypy_xhfast.custom.yaml

# Download Binary File
let downloads = (open downloads.json)
$downloads | each { |item|
    let target = ("./dist" | path join $item.target)
    let needs_download = if ($target | path exists) {
        let current_hash = (open $target | hash sha256)
        if $current_hash == $item.sha256 {
            false
        } else {
            true
        }
    } else { true }

    if $needs_download {
        print $"正在下载文件 ($target) 从 ($item.url)"
        http get $item.url | save $target
        print ">>> 下载终了"
    }
}

print 搞定
