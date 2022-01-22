from fordev.generators import credit_card
from fordev.generators import people
# documentação: https://fordev.readthedocs.io/pt_BR/latest/fordev/generators.html

def cartaoMaster():
    value = credit_card(bank=1)  # Master
    values = value.values()
    values_list = list(values)
    return values_list;

def cartaoVisa():
    value = credit_card(bank=2)  # Visa
    values = value.values()
    values_list = list(values)
    return values_list;

def pessoa4Devs():
    value = people(n=1, sex='M', uf_code='SP')  # Visa
    return value;

# valor = cartaoVisa();
# print(type(valor));
# print(valor);

