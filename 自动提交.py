import time

a = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
b = '''git add --all
git commit -m "%s"
git push origin master
pause''' % a
with open(r"E:\Study-notes\自动提交.bat", "w") as f:
    f.write(b)
