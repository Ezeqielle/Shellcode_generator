from textwrap import wrap

def to_hexa_lendian(n):
    """
    Convert a number to hexadecimal and print it in little endian.
    """
    toHex = n.encode('utf-8').hex()

    # Reverse the string
    toHex = wrap(toHex, 2)
    toHex = toHex[::-1]
    toHex = "".join(str(x) for x in toHex)
    toHex = "0x" + toHex

    # Print the result
    print(f"payload: {toHex}")


# if __name__ == '__main__':
#     """
#     Test function.
#     """
#     cmd = '//bin/sh'
#     to_hexa_lendian(cmd)