#define fossil_malloc PyMem_Malloc
#define fossil_free PyMem_Free
// map fossil memory management to python vm memory management...
// ... do not expect these to actually be used, all buffers are
// managed by the cython code
