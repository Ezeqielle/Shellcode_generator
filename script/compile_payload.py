import subprocess

# payload = "chemain vers le fichier payload.asm"

def compile_pay(payload):
    cmd = "nasm -f elf64 -o out.o "+ payload +".asm; ld -o payload out.o"
    subprocess.call(cmd, shell=True)

def get_payload_hex():
    cmd = "for i in $(objdump -d payload |grep '^ ' |cut -f2); do echo -n '\x'$i; done; echo"
    payloadHex = subprocess.call(cmd, shell=True)
    return payloadHex

def move_payload():
    cmd = "mv payload ../output/"
    subprocess.call(cmd, shell=True)