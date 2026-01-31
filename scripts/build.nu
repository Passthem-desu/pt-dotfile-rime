if ("dist" | path exists) and ("dist" | path type) != "dir" {
    rm "dist"
}

if not ("dist" | path exists) {
    mkdir "dist"
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
cp ./submodules/rime-fast-xhup/custom_phrase.txt ./dist/
cp ./submodules/rime-fast-xhup/idiom_phrase.txt ./dist/
cp ./submodules/rime-fast-xhup/zh-hans-t-essay-bgw.gram ./dist/

# Clean the files I don't want
rm ./dist/flyhe_fast.custom.yaml
rm ./dist/flypy_xhfast.custom.yaml

# Load my own scripts
cp -r ./src/* ./dist/

print 搞定
