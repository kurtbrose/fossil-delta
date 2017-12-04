cdef extern from "alloc_map.h":
    pass

cdef extern from "delta.c":
    # copied from delta.h generated by fossil config+make
    int delta_analyze(const char *zDelta,int lenDelta,int *pnCopy,int *pnInsert)
    int delta_apply(const char *zSrc,int lenSrc,const char *zDelta,
                    int lenDelta,char *zOut)
    int delta_output_size(const char *zDelta,int lenDelta)
    int delta_create(const char *zSrc,unsigned int lenSrc,
                     const char *zOut,unsigned int lenOut,char *zDelta)


cdef class Delta:
    cdef bytes diff

    def __cinit__(self, bytes from_, bytes to):
        cdef bytearray outbuf
        cdef int outlen
        outbuf = bytearray(len(to) + 60)
        outlen = delta_create(from_, len(from_), to, len(to), outbuf)
        self.diff = bytes(outbuf[:outlen])

    def getbytes(self):
        return self.diff
