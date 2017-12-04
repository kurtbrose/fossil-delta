from distutils.core import setup
from Cython.Build import cythonize

setup(
  name = 'fossil-delta',
  ext_modules = cythonize("src/fossil_delta.pyx"),
)