import time

a = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
b = '''cd ..
git add --all
git commit -m "%s"
git push origin master
''' % a
with open(r"自动提交.bat", "w") as f:
    f.write(b)
