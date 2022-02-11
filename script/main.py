from script.hexa_lendian import to_hexa_lendian
from compile_payload import compile_pay, get_payload_hex, move_payload

if __name__ == '__main__':
    """
    Test function.
    """
    cmd = '//bin/sh'
    to_hexa_lendian(cmd)