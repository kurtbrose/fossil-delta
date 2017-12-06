from setuptools import setup
from distutils.extension import Extension
import os

USE_CYTHON = os.environ.get('USE_CYTHON')

ext = '.pyx' if USE_CYTHON else '.c'

extensions = [Extension("fossil_delta", ["src/fossil_delta" + ext])]

if USE_CYTHON:
	from Cython.Build import cythonize
	extensions = cythonize(extensions)

setup(
  name='fossil-delta',
  version='17.12.0',
  description='thin wrapper of string delta functions from fossil SCM',
  url='https://github.com/kurtbrose/fossil-delta',
  platforms='any',
  ext_modules=extensions,
)
