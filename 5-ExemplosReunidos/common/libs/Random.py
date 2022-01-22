from random import seed
from random import randint

def aleatorioDe1a10000():
    # seed random number generator
    #seed(23)
    # generate some integers
    value = randint(1, 10000)
    return value