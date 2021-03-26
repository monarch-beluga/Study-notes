import time

a = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
b = '''git add --all
git commit -m "%s"
git pull origin master
git push origin master
''' % a
with open(r"automatic1.bat", "w") as f:
    f.write(b)
