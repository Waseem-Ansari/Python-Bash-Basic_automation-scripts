import os

folder =  "test_files"
os.makedirs(folder, exist_ok=True)

#create sample files
for i in range(5):
    open(f"{folder}/old_file_{i}.txt", "w").close()
for count, filename in enumerate(os.listdir(folder)):
    src = f"{folder}/{filename}"
    dst = f"{folder}/new_file_{count}.txt"
    os.rename(src, dst)
    print(f"Renamed: {src} - {dst}")