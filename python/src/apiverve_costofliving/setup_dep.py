from setuptools import setup, find_packages

setup(
    name='apiverve_costofliving',
    version='1.1.13',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Cost of Living provides cost of living indices for US regions based on major metropolitan area data. Compare the relative cost of living between states, cities, or regions and calculate salary equivalents for relocation decisions.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/costliving?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
