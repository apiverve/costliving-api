from setuptools import setup, find_packages

setup(
    name='apiverve_costofliving',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Cost of Living is a cost of living API that returns price-level indices for US states and metropolitan areas, with the US average at 100. Compare the relative cost of living between two states or cities and calculate salary equivalents for relocation decisions on paid plans.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/costliving?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
